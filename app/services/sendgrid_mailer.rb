# frozen_string_literal: true

class SendgridMailer
  def self.send(to:, subsitutions:, template_id:)
    data = {
      personalizations: [
        {
          to: [
            {
              email: to
            }
          ],
          dynamic_template_data: subsitutions
        }
      ],
      from: {
        email: "wilmanvasdez@gmail.com"
      },
      template_id: template_id
    }
    sg = SendGrid::API.new(api_key: ENV.fetch("SENDGRID_API_KEY", nil))
    response = sg.client.mail._("send").post(request_body: data)

    response.status_code
  end
end
