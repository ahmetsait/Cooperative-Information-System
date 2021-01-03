<!-- Farm Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('farm_id', config('translations.FarmCrop_TR')['farm_id']) !!}
    {!! Form::number('farm_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Crop Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('crop_id', config('translations.FarmCrop_TR')['crop_id']) !!}
    {!! Form::number('crop_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Planting Date Field -->
<div class="form-group col-sm-6">
    {!! Form::label('planting_date', config('translations.FarmCrop_TR')['planting_date']) !!}
    {!! Form::text('planting_date', null, ['class' => 'form-control','id'=>'planting_date']) !!}
</div>

@push('scripts')
    <script type="text/javascript">
        $('#planting_date').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Area Field -->
<div class="form-group col-sm-6">
    {!! Form::label('area', config('translations.FarmCrop_TR')['area']) !!}
    {!! Form::number('area', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Kaydet', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('farmCrops.index') }}" class="btn btn-default">İptal</a>
</div>
