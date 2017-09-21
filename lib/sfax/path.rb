module SFax
  class Path
    
    def initialize(token, api_key)
      @token = token
      @api_key = api_key
    end

    def send_fax(fax, name, optional_params = {})
      optional_params_string = optional_params.map do |key, value|
        "#{key}=#{URI.escape(value)}"
      end.join(';')
      parts = [
        "sendfax?",
        "token=#{CGI.escape(@token)}",
        "ApiKey=#{CGI.escape(@api_key)}",
        "RecipientFax=#{fax}",
        "RecipientName=#{name}",
        "OptionalParams=#{optional_params_string}&"
      ]
      '/api/' + parts.join('&')
    end

    def fax_status(fax_id)
      parts = [
        "sendfaxstatus?",
        "token=#{CGI.escape(@token)}",
        "ApiKey=#{CGI.escape(@api_key)}",
        "SendFaxQueueId=#{fax_id}"
      ]
      '/api/' + parts.join('&')
    end

    def receive_fax(count)
      parts = [
        "receiveinboundfax?",
        "token=#{CGI.escape(@token)}",
        "ApiKey=#{CGI.escape(@api_key)}",
        "MaxItems=#{count}"
      ]
      '/api/' + parts.join('&')
    end

    def download_fax(fax_id)
      parts = [
        "downloadinboundfaxaspdf?",
        "token=#{CGI.escape(@token)}",
        "ApiKey=#{CGI.escape(@api_key)}",
        "FaxId=#{fax_id}"
      ]
      '/api/' + parts.join('&')
    end

    def fax_statuses
      parts = [
          "receiveoutboundfax?",
          "token=#{CGI.escape(@token)}",
          "ApiKey=#{CGI.escape(@api_key)}",
          "startdateutc=#{(Time.now - (3600 * 24)).utc.iso8601}",
          "enddateutc=#{Time.now.utc.iso8601}"
      ]
      '/api/' + parts.join('&')
    end
  end
end
