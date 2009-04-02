
class String
  def query_param(param_name)
    raise ArgumentError.new("param name can't be nil") if param_name.blank?
    uri = URI.parse(self)
    foo = uri.query ? CGI::parse(uri.query)[param_name] : nil
    case foo
    when Array
      p = foo.first.to_s
    when String
      p = foo
    else
      p = foo ? foo.to_s : nil
    end
  end
end