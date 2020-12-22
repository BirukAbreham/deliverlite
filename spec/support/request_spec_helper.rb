module RequestSpecHelper
  # response parser
  def json_parser
    JSON.parse(response.body)
  end
end