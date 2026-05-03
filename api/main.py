from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware
from httpx import HTTPStatusError

from .schemas import WorkshopSearchRequest, WorkshopSearchResult
from .supabase_client import SupabaseSettingsError, search_workshops

app = FastAPI(title="TallerMatch API", version="0.1.0")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/health")
async def health() -> dict[str, str]:
    return {"status": "ok"}


@app.post("/workshops/search", response_model=list[WorkshopSearchResult])
async def workshops_search(
    request: WorkshopSearchRequest,
) -> list[WorkshopSearchResult]:
    try:
        rows = await search_workshops(request)
    except SupabaseSettingsError as exc:
        raise HTTPException(status_code=503, detail=str(exc)) from exc
    except HTTPStatusError as exc:
        raise HTTPException(
            status_code=exc.response.status_code,
            detail=exc.response.text,
        ) from exc

    return [WorkshopSearchResult(**row) for row in rows]
