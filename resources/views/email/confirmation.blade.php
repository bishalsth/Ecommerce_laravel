<html>
<head>
<title>Register Email</title>
</head>

<body>
    <table>
    <tr>
    <td> Dear{{$name}}</td>
    </tr>

    <tr>
    
    <td>&nbsp;</td></tr>

    <tr><td>Please click on below link to activate your account</td></tr>
    <td>&nbsp;</td></tr>
    <tr><td><a href="{{url('confirm/'.$code)}}">Confirm Your Account</a></td></tr>

    

    <tr><td> Thanks & Regards </td></tr>
    
    <tr><td> E-com Website </td></tr>
    </table>
</body>
</html>