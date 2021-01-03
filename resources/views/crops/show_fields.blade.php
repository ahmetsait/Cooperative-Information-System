<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', config('translations.Crops_TR')['name']) !!}
    <p>{{ $crop->name }}</p>
</div>

<!-- Category Field -->
<div class="form-group">
    {!! Form::label('category', config('translations.Crops_TR')['category']) !!}
    <p>{{ $crop->category }}</p>
</div>

<!-- Seed Unit Price Field -->
<div class="form-group">
    {!! Form::label('seed_unit_price', config('translations.Crops_TR')['seed_unit_price']) !!}
    <p>{{ $crop->seed_unit_price }}</p>
</div>

<!-- Crop Standard Price Field -->
<div class="form-group">
    {!! Form::label('crop_standard_price', config('translations.Crops_TR')['crop_standard_price']) !!}
    <p>{{ $crop->crop_standard_price }}</p>
</div>

<!-- Experience Field -->
<div class="form-group">
    {!! Form::label('experience', config('translations.Crops_TR')['experience']) !!}
    <p>{{ $crop->experience }}</p>
</div>

