<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $cooperative->name }}</p>
</div>

<!-- Establishment Date Field -->
<div class="form-group">
    {!! Form::label('establishment_date', 'Establishment Date:') !!}
    <p>{{ $cooperative->establishment_date }}</p>
</div>

<!-- Founder Id Field -->
<div class="form-group">
    {!! Form::label('founder_id', 'Founder Id:') !!}
    <p>{{ $cooperative->founder_id }}</p>
</div>

<!-- President Id Field -->
<div class="form-group">
    {!! Form::label('president_id', 'President Id:') !!}
    <p>{{ $cooperative->president_id }}</p>
</div>

<!-- City Code Field -->
<div class="form-group">
    {!! Form::label('city_code', 'City Code:') !!}
    <p>{{ $cooperative->city_code }}</p>
</div>

<!-- Address Field -->
<div class="form-group">
    {!! Form::label('address', 'Address:') !!}
    <p>{{ $cooperative->address }}</p>
</div>

<!-- Email Field -->
<div class="form-group">
    {!! Form::label('email', 'Email:') !!}
    <p>{{ $cooperative->email }}</p>
</div>

<!-- Member Count Field -->
<div class="form-group">
    {!! Form::label('member_count', 'Member Count:') !!}
    <p>{{ $cooperative->member_count }}</p>
</div>

