post "/surveys/questions/new" do
  content_type :json
  {form: erb(:"surveys/_survey", layout: false)}.to_json
end
