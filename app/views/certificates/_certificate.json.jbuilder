json.extract! certificate, :id, :name, :qr_code, :user_id, :created_at, :updated_at
json.url certificate_url(certificate, format: :json)
