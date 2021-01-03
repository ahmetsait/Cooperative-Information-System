<!-- Coop Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('cooperative_id', config('translations.CooperativeMember_TR')['cooperative_id']) !!}
    {!! Form::number('cooperative_id', null, ['class' => 'form-control']) !!}
</div>

<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', config('translations.CooperativeMember_TR')['member_id']) !!}
    {!! Form::text('member_id', null, ['class' => 'form-control','maxlength' => 11,'maxlength' => 11]) !!}
</div>

<!-- Registration Field -->
<div class="form-group col-sm-6">
    {!! Form::label('registration', config('translations.CooperativeMember_TR')['registration']) !!}
    {!! Form::text('registration', null, ['class' => 'form-control','id'=>'registration']) !!}
</div>

@push('scripts')
    <script type="text/javascript">
        $('#registration').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            useCurrent: true,
            sideBySide: true
        })
    </script>
@endpush

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Kaydet', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('cooperativeMembers.index') }}" class="btn btn-default">İptal</a>
</div>
