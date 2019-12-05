Private Sub CommandButton1_Click()
    Dim 接続 As Object
    Dim ユーザID As String
    Dim パスワード As String
    Dim サーバ名 As String
    Dim データベース名 As String
    Dim 監視時間 As Long
    Dim 権限モード As Long
    
    'ここからレコードセット
    
    Dim レコードセット As Object
    Dim カーソルエンジン As Long
    Dim カーソルタイプ As Long
    Dim ロック情報 As Long
    Dim オプション As Long
    Dim ソース情報 As String
    
    'ここからテーブル情報
    
    Const コード As String = "code" '// コードの項目名
    Const 企業名 As String = "name" '// 企業名の項目名
    Const アドレス As String = "address"
    Const 電話番号 As String = "phone"
    Const 従業員数 As String = "labors"
    Dim R As Integer
    Const Rmax As Integer = 119

    Set 接続 = New ADODB.Connection
    ユーザID = "nt16145"
    パスワード = "nt16145"
    サーバ名 = "172.30.215.8"
    データベース名 = "r01_j4_exp"
    監視時間 = 10
    接続.ConnectionString = "driver={PostgreSQL Unicode(x64)}" & _
    ";uid=" & ユーザID & _
    ";pwd=" & パスワード & _
    ";server=" & サーバ名 & _
    ";database=" & データベース名
    接続.ConnectionTimeout = 監視時間
    権限モード = adModeRead '//書込= adModeWrite，更新= adModeReadWrite
    接続.Mode = 権限モード
    接続.Open '// 同期接続のみとする(非同期接続は不使用)
    MsgBox 接続.State
    
    Set レコードセット = New ADODB.Recordset
    カーソルエンジン = adUseClient '// クライアント側=adUseClient，サーバ側=adUseServer
    レコードセット.CursorLocation = カーソルエンジン
    カーソルタイプ = adOpenDynamic '// adOpenKeyset，adOpenStatic，adOpenForwardOnly
    ロック情報 = adLockOptimistic '// adLockReadOnly，adLockPessimistic
    オプション = adCmdText '// adCmdUnknown，adCmdTableDirect
    ソース情報 = "select * from company_23" '// SQL 文
    レコードセット.Open ソース情報, 接続, カーソルタイプ, ロック情報, オプション
    '
    If レコードセット.EOF Then
        MsgBox Str(Cells(2, 1).Value)
    Else
        MsgBox レコードセット.GetString
    End If

    For R = 2 To Rmax
        レコードセット.AddNew '// レコード 1 件 追加の準備
        レコードセット.Fields(コード).Value = Cells(R, 1).Value '// 追加企業のコードセット
        レコードセット.Fields(企業名).Value = Cells(R, 2).Value  '// 追加企業の企業漢字名セット
        レコードセット.Fields(アドレス).Value = Cells(R, 3).Value
        レコードセット.Fields(電話番号).Value = Cells(R, 4).Value
        レコードセット.Fields(従業員数).Value = Cells(R, 5).Value
    Next R
    
    レコードセット.Update '// 追加企業のレコード 1 件追加
    '//-----------------------------------------------------
    接続.Close
End Sub

