<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', config('translations.SoilTypes_TR')['name']) !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 100,'maxlength' => 100]) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Kaydet', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('soilTypes.index') }}" class="btn btn-default">İptal</a>
</div>
