json.extract! reader, :id, :first_name, :second_name, :patronymic, :born_on, :home_address, :work_address, :phone, :passport, :created_at, :updated_at
json.url reader_url(reader, format: :json)
