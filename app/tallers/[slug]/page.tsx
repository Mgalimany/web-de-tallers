import { notFound } from "next/navigation";
import { WorkshopDetail } from "@/components/workshop-detail";
import { getWorkshopBySlug, workshops } from "@/lib/mock-data";

export function generateStaticParams() {
  return workshops.map((workshop) => ({
    slug: workshop.slug
  }));
}

export default async function WorkshopPage({
  params
}: {
  params: Promise<{ slug: string }>;
}) {
  const { slug } = await params;
  const workshop = getWorkshopBySlug(slug);

  if (!workshop) {
    notFound();
  }

  return <WorkshopDetail workshop={workshop} />;
}
