json.extract! user, :id, :username, :name, :mother_name, :father_name, :dob, :aadhar_no, :pan_no, :photo, :sign, :cos_id, :phno, :adress, :nationality, :created_at, :updated_at
json.url user_url(user, format: :json)
