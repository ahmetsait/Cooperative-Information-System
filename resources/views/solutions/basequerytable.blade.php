<div class="table-responsive">
    <table class="table" id="farmCrops-table">
        @if(isset($result[0]))
            <thead>
            <tr>
                @foreach( $result[0] as  $header_key => $value )
                    <th>{{ $header_key }}</th>
                @endforeach
            </tr>
            </thead>
            <tbody>

            @foreach(($result) as $row)
                <tr>
                    @foreach( $row as  $row_key => $row_value)
                        <td>{{ $row_value }}</td>
                    @endforeach
                </tr>
            @endforeach
            </tbody>
        @endif

        @if(!isset($result[0]))
            <thead>
            <tr>
                Sorgu Sonucunda Deger Bulunamadi (Boş Sonuç Dizgesi Döndü)
            </tr>
            </thead>
        @endif

    </table>
</div>
