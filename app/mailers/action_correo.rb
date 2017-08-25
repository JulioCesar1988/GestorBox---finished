class ActionCorreo < ApplicationMailer
	 default from: 'gestorbox@millerbi.net'


def bienvenido_email(boxsend)
  
  @box = boxsend
  @user = User.find_by(role: 'archivador') #Pongo el usuario que es archivador en el sistema. 
  mail(to: 'archivador@millerbi.net', subject: 'Se registro un pedido de caja en GestorBox')
end
end
