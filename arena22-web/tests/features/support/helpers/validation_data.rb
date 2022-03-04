module ValidationData

    EMAIL_REGEX = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
    PERCENTAGE_REGEX = /^(\d{1,2}(\.\d{2}))$/

    def validate_required(field_value, field, location)
        if(field_value && field_value.to_s.strip != "")
            return field_value
        end
        raise ValidationError.new("O campo #{field} não pode ser vazio #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end

    def validate_integer(field_value, field, location)
        if(field_value.is_a?(Integer)) 
            return field_value  
        end 
        raise ValidationError.new("#{field} deve ser Inteiro #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end

    def validate_optional_integer(field_value, field, location)
        if(field_value == nil || field_value.to_s.strip == "") 
            return nil  
        end
        self.validate_integer(field_value, field, location)
    end

    def validate_optional_number(field_value, field, location)
        if(field_value == nil || field_value.to_s.strip == "") 
            return nil  
        elsif(field_value.is_a?(Float) || field_value.is_a?(Integer))
            return field_value
        end
        raise ValidationError.new("#{field} deve ser Inteiro ou Float quando existir #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end

    def validate_optional_percentage(field_value, field, location)
        field_value = field_value.to_s.strip
        if(field_value == "") 
            return nil  
        elsif(field_value =~ PERCENTAGE_REGEX)
            return field_value
        end
        raise ValidationError.new("#{field} deve ser string e estar no formato xx.xx #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end

    def validate_cpf(cpf, location)
        cpf = cpf.to_s.strip.delete('.-')
        if(cpf.length == 11)
            return cpf
        end
        raise ValidationError.new("CPF deve ter 11 dígitos #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end 

    def validate_optional_cpf(cpf, location)
        cpf = cpf.to_s.strip.delete('.-')
        if(cpf == "")
            return nil
        end
        self.validate_cpf(cpf, location)
    end 

    def validate_cash(cash, location)
        if(cash.is_a?(Float) || cash.is_a?(Integer))
            return cash
        end
        raise ValidationError.new("O valor à ser adicionado deve ser Inteiro ou float #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end  

    def validate_phone_number(phone_number, field, location)
        phone_number = phone_number.to_s.strip.delete('()-')
        if(phone_number.length == 11)
            return phone_number
        end
        raise ValidationError.new("#{field} deve conter 11 dígitos #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end

    def validate_email(email, field, location)
        email = email.strip
        if(email =~ EMAIL_REGEX)
            return email
        end
        raise ValidationError.new("#{field} com formato inválido #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end

    def validate_password(password, field, location)
        password = password.to_s.strip
        if(password.length >= 8)
            return password
        end
        raise ValidationError.new("#{field} deve conter 8 dígitos ou mais #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end

    def validate_date(date, field, location)
        date = date.to_s.strip
        date_numbers = date.delete('/-')
        d, m, y = [date_numbers.slice(0..1), date_numbers.slice(2..3), date_numbers.slice(4..7)]
        if(date_numbers.length == 8 && Date.valid_date?(y.to_i, m.to_i, d.to_i))
            return date
        end
        raise ValidationError.new("#{field} não é uma data válida ou não está no formato dd/mm/aaaa #{location}")
    rescue ValidationError => e
        log(e.message)
        exit
    end

    def validate_optional_date(date, field, location)
        date_numbers = date.to_s.strip.delete('/-')
        if(date_numbers == "") 
            return nil  
        end
        self.validate_date(date, field, location)
    end
end