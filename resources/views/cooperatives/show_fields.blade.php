<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', config('translations.Cooperatives_TR')['name']) !!}
    <p>{{ $cooperative->name }}</p>
</div>

<!-- Establishment Date Field -->
<div class="form-group">
    {!! Form::label('establishment_date', config('translations.Cooperatives_TR')['establishment_date']) !!}
    <p>{{ $cooperative->establishment_date }}</p>
</div>

<!-- Founder Id Field -->
<div class="form-group">
    {!! Form::label('founder_id', config('translations.Cooperatives_TR')['founder_id']) !!}
    <p>{{ $cooperative->founder_id }}</p>
</div>

<!-- President Id Field -->
<div class="form-group">
    {!! Form::label('president_id', config('translations.Cooperatives_TR')['president_id']) !!}
    <p>{{ $cooperative->president_id }}</p>
</div>

<!-- City Code Field -->
<div class="form-group">
    {!! Form::label('city_code', config('translations.Cooperatives_TR')['city_code']) !!}
    <p>{{ $cooperative->city_code }}</p>
</div>

<!-- Address Field -->
<div class="form-group">
    {!! Form::label('address', config('translations.Cooperatives_TR')['address']) !!}
    <p>{{ $cooperative->address }}</p>
</div>

<!-- Email Field -->
<div class="form-group">
    {!! Form::label('email', config('translations.Cooperatives_TR')['email']) !!}
    <p>{{ $cooperative->email }}</p>
</div>

<!-- Member Count Field -->
<div class="form-group">
    {!! Form::label('member_count', config('translations.Cooperatives_TR')['member_count']) !!}
    <p>{{ $cooperative->member_count }}</p>
</div>

