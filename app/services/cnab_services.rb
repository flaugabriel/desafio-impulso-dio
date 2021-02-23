class CnabServices

  def self.import(params, user_id)
    response = { message: '', status: false }
    process = open_spreadsheet(params[:file])
    if process[:file_status]
      File.open(process[:path]) do |f|
        f.each_line do |line|
          if line != "\n"
            object_hash = serialize_cnab(line)
            deal = Deal.where(type_transaction: object_hash.last[:type_cnabs].to_i).take
            store = Store.where(cpf: object_hash.last[:cpf]).take
            new_total = object_hash.last[:value].to_f / 100

            if store.present?
              store.update(
                store_owner: object_hash.last[:store_owner].strip,
                store_name: object_hash.last[:store_name].strip,
                balance_total:  store.balance_total.send(deal.signal,new_total),
              )
            else
              store = Store.new(cpf: object_hash.last[:cpf],
                                   store_owner: object_hash.last[:store_owner].strip,
                                   store_name: object_hash.last[:store_name].strip,
                                   balance_total: new_total)
                                   store.save
            end
            object_cnab = Cnab.new(
              type_cnabs: object_hash.last[:type_cnabs].to_i,
              date_occurrence: object_hash.last[:date_occurrence],
              value: new_total,
              card: object_hash.last[:card].to_i,
              hours: object_hash.last[:hours],
              deal_id: object_hash.last[:type_cnabs].to_i,
              store_id: store.id,
              user_id: user_id,
            )
            if object_cnab.save
              response[:message] = 'CNAB importada com sucesso!'
              response[:status] = true
            else
              response[:message] = 'Documento com linhas invalidas!'
              response[:status] = false
            end
          else
            response[:message] = 'Documento sem CNAB!'
            response[:status] = false
          end
        end
      end
    else
      response[:message] = process[:message]
      response[:status] = process[:file_status]
    end
    response
  end

  private

  def self.serialize_cnab(line)
    documents = [
      type_cnabs: {
        start: 1,
        end: 1,
        size: 1,
        value: '',
      },
      date_occurrence: {
        start: 2,
        end: 9,
        size: 8,
        value: '',
      },
      value: {
        start: 10,
        end: 19,
        size: 10,
        value: '',
      },
      cpf: {
        start: 20,
        end: 30,
        size: 11,
        value: '',
      },
      card: {
        start: 31,
        end: 42,
        size: 12,
        value: '',
      },
      hours: {
        start: 43,
        end: 48,
        size: 6,
        value: '',
      },
      store_owner: {
        start: 49,
        end: 62,
        size: 14,
        value: '',
      },
      store_name: {
        start: 63,
        end: 81,
        size: 19,
        value: '',
      },
    ]
    documents.each do |datas|
      datas.keys.each do |key|
        size_validate = line[datas[key][:start] - 1...datas[key][:end]]
        if size_validate.length == datas[key][:size]
          datas.delete(datas[key][:start])
          datas.delete(datas[key][:size])
          datas.delete(datas[key][:end])
          datas[key] = size_validate
        end
      end
    end
    documents
  end

  def self.open_spreadsheet(cnab_params)
    process = { path: "", message: "", file_status: false }
    if cnab_params.nil? == false
      case File.extname(cnab_params.original_filename)
      when ".txt"
        process[:path] = cnab_params.path
        process[:file_status] = true
      else
        process[:message] = "Arquvivo desconhecido: #{cnab_params.original_filename}"
        process[:file_status] = false
      end
    else
      process[:message] = "Nem um arquivo carregado!"
      process[:file_status] = false
    end
    process
  end
end