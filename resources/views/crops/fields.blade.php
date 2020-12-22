<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::text('name', null, ['class' => 'form-control','maxlength' => 50,'maxlength' => 50]) !!}
</div>

<!-- Category Field -->
<div class="form-group col-sm-6">
    {!! Form::label('category', 'Category:') !!}
    {!! Form::text('category', null, ['class' => 'form-control','maxlength' => 20,'maxlength' => 20]) !!}
</div>

<!-- Seed Unit Price Field -->
<div class="form-group col-sm-6">
    {!! Form::label('seed_unit_price', 'Seed Unit Price:') !!}
    {!! Form::number('seed_unit_price', null, ['class' => 'form-control']) !!}
</div>

<!-- Crop Standard Price Field -->
<div class="form-group col-sm-6">
    {!! Form::label('crop_standard_price', 'Crop Standard Price:') !!}
    {!! Form::number('crop_standard_price', null, ['class' => 'form-control']) !!}
</div>

<!-- Experience Field -->
<div class="form-group col-sm-6">
    {!! Form::label('experience', 'Experience:') !!}
    {!! Form::number('experience', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('crops.index') }}" class="btn btn-default">Cancel</a>
</div>
