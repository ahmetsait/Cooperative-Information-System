<!-- Registration Field -->
<div class="form-group">
    {!! Form::label('registration', 'Registration:') !!}
    <p>{{ $farm->registration }}</p>
</div>

<!-- Owner Id Field -->
<div class="form-group">
    {!! Form::label('owner_id', 'Owner Id:') !!}
    <p>{{ $farm->owner_id }}</p>
</div>

<!-- City Code Field -->
<div class="form-group">
    {!! Form::label('city_code', 'City Code:') !!}
    <p>{{ $farm->city_code }}</p>
</div>

<!-- Latitude Field -->
<div class="form-group">
    {!! Form::label('latitude', 'Latitude:') !!}
    <p>{{ $farm->latitude }}</p>
</div>

<!-- Longitude Field -->
<div class="form-group">
    {!! Form::label('longitude', 'Longitude:') !!}
    <p>{{ $farm->longitude }}</p>
</div>

<!-- Area Field -->
<div class="form-group">
    {!! Form::label('area', 'Area:') !!}
    <p>{{ $farm->area }}</p>
</div>

<!-- Soil Type Field -->
<div class="form-group">
    {!! Form::label('soil_type', 'Soil Type:') !!}
    <p>{{ $farm->soil_type }}</p>
</div>

<!-- Unit Worth Field -->
<div class="form-group">
    {!! Form::label('unit_worth', 'Unit Worth:') !!}
    <p>{{ $farm->unit_worth }}</p>
</div>

