module BreadcrumbsHelper
  def auto_breadcrumbs
    segments = request.path.split("/").reject(&:blank?)
    crumbs = [{ label: "Dashboard", path: root_path }]

    path_so_far = ""
    segments.each do |segment|
      path_so_far += "/#{segment}"

      if segment.match?(/\A[0-9a-f]{8}-[0-9a-f]{4}-/)
        crumbs << { label: resolve_record_label(segments, segment), path: path_so_far }
      else
        crumbs << { label: segment.titleize, path: path_so_far }
      end
    end

    crumbs.last[:path] = nil
    crumbs
  end

  private

  def resolve_record_label(segments, uuid)
    resource_name = segments[segments.index(uuid) - 1]

    case resource_name
    when "job_postings"
      JobPosting.find_by(id: uuid)&.title
    when "sections"
      Section.find_by(id: uuid)&.title
    else
      uuid
    end
  end
end