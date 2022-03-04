class ValidationError < StandardError
  def initialize(msg="Erro de validação", exception_type="custom")
    @exception_type = exception_type
    super(msg)
  end
end