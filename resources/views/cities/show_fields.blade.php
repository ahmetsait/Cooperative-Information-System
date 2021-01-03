<!-- Name Field -->
<div class="form-group">
    {!! Form::label('code', config('translations.Cities_TR')['code']) !!}
    <p>{{ $city->code }}</p>
</div>

<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', config('translations.Cities_TR')['name']) !!}
    <p>{{ $city->name }}</p>
</div>

<!-- Area Field -->
<div class="form-group">
    {!! Form::label('area', config('translations.Cities_TR')['area']) !!}
    <p>{{ $city->area }}</p>
</div>

