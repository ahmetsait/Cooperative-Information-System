<!-- Registration Field -->
<div class="form-group col-sm-6">
    {!! Form::label('registration', 'Registration:') !!}
    {!! Form::text('registration', null, ['class' => 'form-control','id'=>'registration']) !!}
</div>

@push('scripts')
    <script type="text/javascript">
        $('#registration').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Owner Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('owner_id', 'Owner Id:') !!}
    {!! Form::text('owner_id', null, ['class' => 'form-control','maxlength' => 11,'maxlength' => 11]) !!}
</div>

<!-- City Code Field -->
<div class="form-group col-sm-6">
    {!! Form::label('city_code', 'City Code:') !!}
    {!! Form::number('city_code', null, ['class' => 'form-control']) !!}
</div>

<!-- Latitude Field -->
<div class="form-group col-sm-6">
    {!! Form::label('latitude', 'Latitude:') !!}
    {!! Form::number('latitude', null, ['class' => 'form-control']) !!}
</div>

<!-- Longitude Field -->
<div class="form-group col-sm-6">
    {!! Form::label('longitude', 'Longitude:') !!}
    {!! Form::number('longitude', null, ['class' => 'form-control']) !!}
</div>

<!-- Area Field -->
<div class="form-group col-sm-6">
    {!! Form::label('area', 'Area:') !!}
    {!! Form::number('area', null, ['class' => 'form-control']) !!}
</div>

<!-- Soil Type Field -->
<div class="form-group col-sm-6">
    {!! Form::label('soil_type', 'Soil Type:') !!}
    {!! Form::number('soil_type', null, ['class' => 'form-control']) !!}
</div>

<!-- Unit Worth Field -->
<div class="form-group col-sm-6">
    {!! Form::label('unit_worth', 'Unit Worth:') !!}
    {!! Form::number('unit_worth', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('farms.index') }}" class="btn btn-default">Cancel</a>
</div>
