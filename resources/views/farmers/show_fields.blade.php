<!-- TC Kimlik Field -->
<div class="form-group">
    {!! Form::label('id', config('translations.Farmers_TR')['id']) !!}
    <p>{{ $farmer->id }}</p>
</div>

<!-- Registration Field -->
<div class="form-group">
    {!! Form::label('registration', config('translations.Farmers_TR')['registration']) !!}
    <p>{{ $farmer->registration }}</p>
</div>

<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', config('translations.Farmers_TR')['name']) !!}
    <p>{{ $farmer->name }}</p>
</div>

<!-- Surname Field -->
<div class="form-group">
    {!! Form::label('surname', config('translations.Farmers_TR')['surname']) !!}
    <p>{{ $farmer->surname }}</p>
</div>

<!-- Birthday Field -->
<div class="form-group">
    {!! Form::label('birthday', config('translations.Farmers_TR')['birthday']) !!}
    <p>{{ $farmer->birthday }}</p>
</div>

<!-- Phone Field -->
<div class="form-group">
    {!! Form::label('phone', config('translations.Farmers_TR')['phone']) !!}
    <p>{{ $farmer->phone }}</p>
</div>

<!-- Email Field -->
<div class="form-group">
    {!! Form::label('email', config('translations.Farmers_TR')['email']) !!}
    <p>{{ $farmer->email }}</p>
</div>

<!-- Address Field -->
<div class="form-group">
    {!! Form::label('address', config('translations.Farmers_TR')['address']) !!}
    <p>{{ $farmer->address }}</p>
</div>

<!-- Experience Field -->
<div class="form-group">
    {!! Form::label('experience', config('translations.Farmers_TR')['experience']) !!}
    <p>{{ $farmer->experience }}</p>
</div>

