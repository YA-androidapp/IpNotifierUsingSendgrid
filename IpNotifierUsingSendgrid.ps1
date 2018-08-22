Set-ExecutionPolicy RemoteSigned -Scope Process

$SmtpServer = 'smtp.sendgrid.net'
$Port = 587
$UserName = 'azure_***@azure.com'
$Password = '***'
$MailFrom = 'notify@***.onmicrosoft.com'
$MailTo = '***@***.jp'
$Subject = 'notify'
$Body = (Invoke-WebRequest inet-ip.info/ip).Content
$pwd = ConvertTo-SecureString -AsPlainText -Force -String $Password
$cred = New-Object System.Management.Automation.PSCredential $UserName,$pwd
Send-MailMessage -Body $Body -Credential $cred -From $MailFrom -Port $Port -SmtpServer $SmtpServer -Subject $Subject -To $MailTo -UseSsl