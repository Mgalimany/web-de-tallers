import os
from typing import Any

import httpx

from .schemas import WorkshopSearchRequest


class SupabaseSettingsError(RuntimeError):
    pass


def get_supabase_settings() -> tuple[str, str]:
    url = os.getenv("SUPABASE_URL") or os.getenv("NEXT_PUBLIC_SUPABASE_URL")
    key = os.getenv("SUPABASE_SERVICE_ROLE_KEY") or os.getenv(
        "NEXT_PUBLIC_SUPABASE_ANON_KEY"
    )

    if not url or not key:
        raise SupabaseSettingsError("Supabase URL or key is not configured")

    return url.rstrip("/"), key


async def search_workshops(request: WorkshopSearchRequest) -> list[dict[str, Any]]:
    url, key = get_supabase_settings()
    payload = {
        "p_lat": request.lat,
        "p_lng": request.lng,
        "p_radius_m": request.radius_m,
        "p_make_id": request.make_id,
        "p_service_code": request.service_code,
        "p_max_hourly_rate_eur": request.max_hourly_rate_eur,
        "p_min_bayesian_score": request.min_bayesian_score,
        "p_limit": request.limit,
        "p_offset": request.offset,
    }

    async with httpx.AsyncClient(timeout=12) as client:
        response = await client.post(
            f"{url}/rest/v1/rpc/search_workshops",
            headers={
                "apikey": key,
                "Authorization": f"Bearer {key}",
                "Content-Type": "application/json",
            },
            json=payload,
        )
        response.raise_for_status()
        return response.json()
