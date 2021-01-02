@extends('layouts.app')

@section('content')
    <section class="content-header">
        <h1>
            Çiftçi
        </h1>
    </section>
    <div class="content">
        <div class="box box-primary">
            <div class="box-body">
                <div class="row" style="padding-left: 20px">
                    @include('farmers.show_fields')
                    <a href="{{ route('farmers.index') }}" class="btn btn-default">Geri</a>
                </div>
            </div>
        </div>
    </div>
@endsection
