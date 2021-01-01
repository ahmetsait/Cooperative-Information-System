<!-- Farm Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('farm_id', 'Farm Id:') !!}
    {!! Form::number('farm_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Crop Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('crop_id', 'Crop Id:') !!}
    {!! Form::number('crop_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Planting Date Field -->
<div class="form-group col-sm-6">
    {!! Form::label('planting_date', 'Planting Date:') !!}
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
    {!! Form::label('area', 'Area:') !!}
    {!! Form::number('area', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('farmCrops.index') }}" class="btn btn-default">Cancel</a>
</div>
