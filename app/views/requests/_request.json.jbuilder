json.extract! request, :id, :requester_id, :sender_id, :amount, :message, :status, :sender_phno, :created_at, :updated_at
json.url request_url(request, format: :json)
