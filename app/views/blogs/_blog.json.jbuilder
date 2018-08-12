json.extract! blog, :id, :title, :content, :starting_time, :finishing_time, :recruitment_number, :user_id, :applicant_id, :applicant_number, :created_at, :updated_at
json.url blog_url(blog, format: :json)
