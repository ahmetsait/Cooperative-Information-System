<!-- Registration Field -->
<div class="form-group">
    {!! Form::label('registration', config('translations.Farms_TR')['registration']) !!}
    <p>{{ $farm->registration }}</p>
</div>

<!-- Owner Id Field -->
<div class="form-group">
    {!! Form::label('owner_id', config('translations.Farms_TR')['owner_id']) !!}
    <p>{{ $farm->owner_id }}</p>
</div>

<!-- City Code Field -->
<div class="form-group">
    {!! Form::label('city_code', config('translations.Farms_TR')['city_code']) !!}
    <p>{{ $farm->city_code }}</p>
</div>

<!-- Latitude Field -->
<div class="form-group">
    {!! Form::label('latitude', config('translations.Farms_TR')['latitude']) !!}
    <p>{{ $farm->latitude }}</p>
</div>

<!-- Longitude Field -->
<div class="form-group">
    {!! Form::label('longitude', config('translations.Farms_TR')['longitude']) !!}
    <p>{{ $farm->longitude }}</p>
</div>

<!-- Area Field -->
<div class="form-group">
    {!! Form::label('area', config('translations.Farms_TR')['area']) !!}
    <p>{{ $farm->area }}</p>
</div>

<!-- Soil Type Field -->
<div class="form-group">
    {!! Form::label('soil_type', config('translations.Farms_TR')['soil_type']) !!}
    <p>{{ $farm->soil_type }}</p>
</div>

<!-- Unit Worth Field -->
<div class="form-group">
    {!! Form::label('unit_worth', config('translations.Farms_TR')['unit_worth']) !!}
    <p>{{ $farm->unit_worth }}</p>
</div>

