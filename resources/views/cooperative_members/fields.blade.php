<!-- Member Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('member_id', 'Member Id:') !!}
    {!! Form::text('member_id', null, ['class' => 'form-control','maxlength' => 11,'maxlength' => 11]) !!}
</div>

<!-- Registration Field -->
<div class="form-group col-sm-6">
    {!! Form::label('registration', 'Registration:') !!}
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
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('cooperativeMembers.index') }}" class="btn btn-default">Cancel</a>
</div>
