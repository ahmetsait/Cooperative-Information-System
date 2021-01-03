<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', config('translations.Crops_TR')['name']) !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 50,'maxlength' => 50]) !!}
</div>

<!-- Category Field -->
<div class="form-group col-sm-6">
    {!! Form::label('category', config('translations.Crops_TR')['category']) !!}
    {!! Form::text('category', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Seed Unit Price Field -->
<div class="form-group col-sm-6">
    {!! Form::label('seed_unit_price', config('translations.Crops_TR')['seed_unit_price']) !!}
    {!! Form::number('seed_unit_price', null, ['class' => 'form-control']) !!}
</div>

<!-- Crop Standard Price Field -->
<div class="form-group col-sm-6">
    {!! Form::label('crop_standard_price', config('translations.Crops_TR')['crop_standard_price']) !!}
    {!! Form::number('crop_standard_price', null, ['class' => 'form-control']) !!}
</div>

<!-- Experience Field -->
<div class="form-group col-sm-6">
    {!! Form::label('experience', config('translations.Crops_TR')['experience']) !!}
    {!! Form::number('experience', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Kaydet', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('crops.index') }}" class="btn btn-default">İptal</a>
</div>
