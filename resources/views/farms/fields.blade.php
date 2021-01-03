<!-- Registration Field -->
<div class="form-group col-sm-6">
    {!! Form::label('registration', config('translations.Farms_TR')['registration']) !!}
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
    {!! Form::label('owner_id', config('translations.Farms_TR')['owner_id']) !!}
    {!! Form::text('owner_id', null, ['class' => 'form-control','maxlength' => 11,'maxlength' => 11]) !!}
</div>

<!-- City Code Field -->
<div class="form-group col-sm-6">
    {!! Form::label('city_code', config('translations.Farms_TR')['city_code']) !!}
    {!! Form::number('city_code', null, ['class' => 'form-control']) !!}
</div>

<!-- Latitude Field -->
<div class="form-group col-sm-6">
    {!! Form::label('latitude', config('translations.Farms_TR')['latitude']) !!}
    {!! Form::number('latitude', null, ['class' => 'form-control']) !!}
</div>

<!-- Longitude Field -->
<div class="form-group col-sm-6">
    {!! Form::label('longitude', config('translations.Farms_TR')['longitude']) !!}
    {!! Form::number('longitude', null, ['class' => 'form-control']) !!}
</div>

<!-- Area Field -->
<div class="form-group col-sm-6">
    {!! Form::label('area', config('translations.Farms_TR')['area']) !!}
    {!! Form::number('area', null, ['class' => 'form-control']) !!}
</div>

<!-- Soil Type Field -->
<div class="form-group col-sm-6">
    {!! Form::label('soil_type', config('translations.Farms_TR')['soil_type']) !!}
    {!! Form::number('soil_type', null, ['class' => 'form-control']) !!}
</div>

<!-- Unit Worth Field -->
<div class="form-group col-sm-6">
    {!! Form::label('unit_worth', config('translations.Farms_TR')['unit_worth']) !!}
    {!! Form::number('unit_worth', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Kaydet', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('farms.index') }}" class="btn btn-default">İptal</a>
</div>
