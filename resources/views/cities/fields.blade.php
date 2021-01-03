<!-- City Code Field -->
<div class="form-group col-sm-6">
    {!! Form::label('code', config('translations.Cities_TR')['code']) !!}
    {!! Form::number('code', null, ['class' => 'form-control']) !!}
</div>

<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', config('translations.Cities_TR')['name']) !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 100,'maxlength' => 100]) !!}
</div>

<!-- Area Field -->
<div class="form-group col-sm-6">
    {!! Form::label('area', config('translations.Cities_TR')['area']) !!}
    {!! Form::number('area', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Kaydet', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('cities.index') }}" class="btn btn-default">İptal</a>
</div>
