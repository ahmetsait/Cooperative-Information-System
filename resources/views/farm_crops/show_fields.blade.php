<!-- Crop Id Field -->
<div class="form-group">
    {!! Form::label('crop_id', 'Crop Id:') !!}
    <p>{{ $farmCrop->crop_id }}</p>
</div>

<!-- Planting Date Field -->
<div class="form-group">
    {!! Form::label('planting_date', 'Planting Date:') !!}
    <p>{{ $farmCrop->planting_date }}</p>
</div>

<!-- Area Field -->
<div class="form-group">
    {!! Form::label('area', 'Area:') !!}
    <p>{{ $farmCrop->area }}</p>
</div>

