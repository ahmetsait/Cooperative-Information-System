<!-- TC Kimlik Field -->
<div class="form-group col-sm-6">
    {!! Form::label('id', config('translations.Farmers_TR')['id']) !!}
    {!! Form::text('id', null, ['class' => 'form-control','minlength' => 11,'maxlength' => 11]) !!}
</div>

<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', config('translations.Farmers_TR')['name']) !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 100,'maxlength' => 100]) !!}
</div>

<!-- Surname Field -->
<div class="form-group col-sm-6">
    {!! Form::label('surname', config('translations.Farmers_TR')['surname']) !!}
    {!! Form::text('surname', null, ['class' => 'form-control','maxlength' => 100,'maxlength' => 100]) !!}
</div>

<!-- Birthday Field -->
<div class="form-group col-sm-6">
    {!! Form::label('birthday', config('translations.Farmers_TR')['birthday']) !!}
    {!! Form::text('birthday', null, ['class' => 'form-control','id'=>'birthday']) !!}
</div>

@push('scripts')
    <script type="text/javascript">
        $('#birthday').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Phone Field -->
<div class="form-group col-sm-6">
    {!! Form::label('phone', config('translations.Farmers_TR')['phone']) !!}
    {!! Form::text('phone', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Email Field -->
<div class="form-group col-sm-6">
    {!! Form::label('email', config('translations.Farmers_TR')['email']) !!}
    {!! Form::email('email', null, ['class' => 'form-control','maxlength' => 254,'maxlength' => 254]) !!}
</div>

<!-- Address Field -->
<div class="form-group col-sm-6">
    {!! Form::label('address', config('translations.Farmers_TR')['address']) !!}
    {!! Form::text('address', null, ['class' => 'form-control','maxlength' => 500,'maxlength' => 500]) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Kaydet', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('farmers.index') }}" class="btn btn-default">İptal</a>
</div>
