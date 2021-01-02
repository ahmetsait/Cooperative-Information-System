<?php
    $Farmers_TR = [
        "id"	=> "TC Kimlik Numarası",
        "registration"	=> "Kayıt Tarihi",
        "name"	=> "İsim",
        "surname"	=> "Soy İsim",
        "birthday"	=> "Doğum Tarihi",
        "phone"	=> "Telefon Numarası",
        "email"	=> "E-Posta",
        "address"	=> "Adres",
        "experience"	=> "Deneyim",
    ];
?>

<!-- TC Kimlik Field -->
<div class="form-group">
    {!! Form::label('id', $Farmers_TR['id']) !!}
    <p>{{ $farmer->id }}</p>
</div>

<!-- Registration Field -->
<div class="form-group">
    {!! Form::label('registration', $Farmers_TR['registration']) !!}
    <p>{{ $farmer->registration }}</p>
</div>

<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', $Farmers_TR['name']) !!}
    <p>{{ $farmer->name }}</p>
</div>

<!-- Surname Field -->
<div class="form-group">
    {!! Form::label('surname', $Farmers_TR['surname']) !!}
    <p>{{ $farmer->surname }}</p>
</div>

<!-- Birthday Field -->
<div class="form-group">
    {!! Form::label('birthday', $Farmers_TR['birthday']) !!}
    <p>{{ $farmer->birthday }}</p>
</div>

<!-- Phone Field -->
<div class="form-group">
    {!! Form::label('phone', $Farmers_TR['phone']) !!}
    <p>{{ $farmer->phone }}</p>
</div>

<!-- Email Field -->
<div class="form-group">
    {!! Form::label('email', $Farmers_TR['email']) !!}
    <p>{{ $farmer->email }}</p>
</div>

<!-- Address Field -->
<div class="form-group">
    {!! Form::label('address', $Farmers_TR['address']) !!}
    <p>{{ $farmer->address }}</p>
</div>

<!-- Experience Field -->
<div class="form-group">
    {!! Form::label('experience', $Farmers_TR['experience']) !!}
    <p>{{ $farmer->experience }}</p>
</div>

