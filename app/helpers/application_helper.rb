module ApplicationHelper
  def flash_message
    notification = ""
    %i[success info warning error].each do |type|
      next unless flash[type]

      notification += "<script>
        toastr.#{type}('#{flash[type]}')
      </script>"
    end
    notification.html_safe
  end

  def number_to_currency_br(number)
    number_to_currency(number, unit: "R$ ", separator: ",", delimiter: ".")
  end

  def balance_color(balance_total)
    if balance_total > 0.0
      'success'
    else
      'danger'
    end
  end

  def transaction_color(balance_total)
    if balance_total == '+'
      'success'
    else
      'danger'
    end
  end
end
