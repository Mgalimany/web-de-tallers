import { notFound } from "next/navigation";
import { WorkshopDetail } from "@/components/workshop-detail";
import { getWorkshopBySlug } from "@/lib/workshops";
import { workshops as mockWorkshops } from "@/lib/mock-data";

export function generateStaticParams() {
  return mockWorkshops.map((workshop) => ({
    slug: workshop.slug
  }));
}

export default async function WorkshopPage({
  params
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const workshop = await getWorkshopBySlug(slug);

  if (!workshop) {
    notFound();
  }

  return <WorkshopDetail workshop={workshop} />;
}
