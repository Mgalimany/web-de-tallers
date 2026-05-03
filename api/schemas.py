from pydantic import BaseModel, Field


class WorkshopSearchRequest(BaseModel):
    lat: float = Field(default=41.3874, ge=-90, le=90)
    lng: float = Field(default=2.1686, ge=-180, le=180)
    radius_m: int = Field(default=25_000, ge=100, le=200_000)
    make_id: int | None = None
    service_code: str | None = None
    max_hourly_rate_eur: float | None = Field(default=None, ge=0)
    min_bayesian_score: float | None = Field(default=None, ge=0, le=10)
    limit: int = Field(default=50, ge=1, le=100)
    offset: int = Field(default=0, ge=0)


class WorkshopSearchResult(BaseModel):
    id: str
    name: str
    slug: str
    address_line: str | None = None
    municipality: str | None = None
    province: str | None = None
    latitude: float
    longitude: float
    distance_m: float
    hourly_rate_eur: float | None = None
    verified: bool
    dgt_libro_taller: bool
    review_count: int
    avg_overall_score: float | None = None
    bayesian_score: float | None = None
    brand_match: bool
