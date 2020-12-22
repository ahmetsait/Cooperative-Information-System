<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $crop->name }}</p>
</div>

<!-- Category Field -->
<div class="form-group">
    {!! Form::label('category', 'Category:') !!}
    <p>{{ $crop->category }}</p>
</div>

<!-- Seed Unit Price Field -->
<div class="form-group">
    {!! Form::label('seed_unit_price', 'Seed Unit Price:') !!}
    <p>{{ $crop->seed_unit_price }}</p>
</div>

<!-- Crop Standard Price Field -->
<div class="form-group">
    {!! Form::label('crop_standard_price', 'Crop Standard Price:') !!}
    <p>{{ $crop->crop_standard_price }}</p>
</div>

<!-- Experience Field -->
<div class="form-group">
    {!! Form::label('experience', 'Experience:') !!}
    <p>{{ $crop->experience }}</p>
</div>

