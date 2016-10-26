class UserNotifier < ApplicationMailer
default :from => 'gestorbox@millerbi.net'

def send_signup_email(user)
	mail:to =>@user.email,
	subject => 'Envio de mensaje de Gestorbox '
end

end
