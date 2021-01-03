<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', config('translations.Cooperatives_TR')['name']) !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 50,'maxlength' => 50]) !!}
</div>

<!-- Establishment Date Field -->
<div class="form-group col-sm-6">
    {!! Form::label('establishment_date', config('translations.Cooperatives_TR')['establishment_date']) !!}
    {!! Form::text('establishment_date', null, ['class' => 'form-control','id'=>'establishment_date']) !!}
</div>

@push('scripts')
    <script type="text/javascript">
        $('#establishment_date').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Founder Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('founder_id', config('translations.Cooperatives_TR')['founder_id']) !!}
    {!! Form::text('founder_id', null, ['class' => 'form-control','maxlength' => 11,'maxlength' => 11]) !!}
</div>

<!-- President Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('president_id', config('translations.Cooperatives_TR')['president_id']) !!}
    {!! Form::text('president_id', null, ['class' => 'form-control','maxlength' => 11,'maxlength' => 11]) !!}
</div>

<!-- City Code Field -->
<div class="form-group col-sm-6">
    {!! Form::label('city_code', config('translations.Cooperatives_TR')['city_code']) !!}
    {!! Form::number('city_code', null, ['class' => 'form-control']) !!}
</div>

<!-- Address Field -->
<div class="form-group col-sm-6">
    {!! Form::label('address', config('translations.Cooperatives_TR')['address']) !!}
    {!! Form::text('address', null, ['class' => 'form-control','maxlength' => 500,'maxlength' => 500]) !!}
</div>

<!-- Email Field -->
<div class="form-group col-sm-6">
    {!! Form::label('email', config('translations.Cooperatives_TR')['email']) !!}
    {!! Form::email('email', null, ['class' => 'form-control','maxlength' => 254,'maxlength' => 254]) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Kaydet', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('cooperatives.index') }}" class="btn btn-default">İptal</a>
</div>
