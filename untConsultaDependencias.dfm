object frmConsultaDependencias: TfrmConsultaDependencias
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consultar Dependencia'
  ClientHeight = 638
  ClientWidth = 644
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 644
    Height = 638
    Align = alClient
    TabOrder = 0
    object dbgInicioConsulta: TDBGrid
      Left = 1
      Top = 113
      Width = 642
      Height = 524
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      DataSource = dmConsultaDependencias.dsConsulta
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 642
      Height = 112
      Align = alTop
      TabOrder = 1
      object lblSistema: TLabel
        Left = 12
        Top = 7
        Width = 37
        Height = 13
        Caption = 'Sistema'
      end
      object lblVersao: TLabel
        Left = 12
        Top = 59
        Width = 33
        Height = 13
        Caption = 'Vers'#227'o'
      end
      object lblGrupo: TLabel
        Left = 438
        Top = 7
        Width = 29
        Height = 13
        Caption = 'Grupo'
        Visible = False
      end
      object Label1: TLabel
        Left = 395
        Top = 7
        Width = 37
        Height = 13
        Caption = 'Grupo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
      end
      object Label2: TLabel
        Left = 172
        Top = 59
        Width = 29
        Height = 13
        Caption = 'Grupo'
      end
      object cboSistema: TDBLookupComboBox
        Left = 12
        Top = 23
        Width = 305
        Height = 21
        KeyField = 'SEQUENCIA'
        ListField = 'NOME'
        ListSource = dmConsultaDependencias.dsSistema
        TabOrder = 0
        OnClick = cboSistemaClick
      end
      object cboVersao: TDBLookupComboBox
        Left = 12
        Top = 75
        Width = 151
        Height = 21
        KeyField = 'VERSAO_SISTEMA'
        ListField = 'VERSAO_SISTEMA'
        ListSource = dmConsultaDependencias.dsVersao
        TabOrder = 1
        OnClick = cboVersaoClick
      end
      object Button1: TButton
        Left = 528
        Top = 71
        Width = 97
        Height = 25
        Caption = 'Imprimir Relat'#243'rio'
        TabOrder = 2
        OnClick = Button1Click
      end
      object cboGrupo: TDBLookupComboBox
        Left = 172
        Top = 75
        Width = 145
        Height = 21
        KeyField = 'SEQUENCIA'
        ListField = 'DESCRICAO'
        ListSource = dmConsultaDependencias.dsGrupo
        TabOrder = 3
        OnClick = cboGrupoClick
      end
    end
    object RLReport1: TRLReport
      Left = 741
      Top = 519
      Width = 794
      Height = 1123
      DataSource = dmConsultaDependencias.dsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      Title = 'Relat'#243'rioVers'#245'esSistema'
      object RLBand1: TRLBand
        Left = 38
        Top = 38
        Width = 718
        Height = 150
        AutoSize = True
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel4: TRLLabel
          Left = 172
          Top = 35
          Width = 143
          Height = 16
          Caption = 'Sistema Selecionado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 172
          Top = 55
          Width = 122
          Height = 16
          Caption = 'Grupo de Sistema:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblSistemaSelecionado: TRLLabel
          Left = 321
          Top = 35
          Width = 55
          Height = 16
          Caption = 'Sistema'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblGrupoSistema: TRLLabel
          Left = 321
          Top = 55
          Width = 43
          Height = 16
          Caption = 'Grupo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLImage1: TRLImage
          Left = 3
          Top = 3
          Width = 153
          Height = 146
          Picture.Data = {
            0954506E67496D61676589504E470D0A1A0A0000000D49484452000000960000
            009608060000003C0171E2000000097048597300000B1300000B1301009A9C18
            000000017352474200AECE1CE90000000467414D410000B18F0BFC610500001F
            984944415478DAED5D097C53C5D6FFDFA45064AF5020C8523EF4298A2C0FF13D
            FD9E0F70F9101459BB2F141790A728F81054100A8820A06C2A8B082DDD5B9696
            AD2CB2EF2D50283B45BAB0EFA55068D326F79B4929264DD2DC3BB937372DF9FF
            7E85E42677E6CCDC7FCE9C3973E60C07175C90019CD202B85035E122960BB2C0
            452C1764818B582EC80217B15C90052E62B9200B5CC4724116B888E5822C78BC
            89151C5C0B9191054A8B5115F1F812CBDBBB1ED435A200DD16C4C5CC545A9CAA
            86C793589D3A55C3336D5681E7DF26EF4A00FD68B4797616C2C2F44A8B5655F0
            F811CB7B703D70F712C1716F195D2584E2BE447CD44F4A8B5755F07811AB4F68
            7DD4D02E07CFBD6EE1533D21DB64C4458D535ACCAA80C787587D431AC0BD24C1
            0AA94AC1F33C54F81ABAE219484CD4292D7265C6E3412C6FEFEA50BBA710E2BC
            2EE0DB7458FC0A572FCCC4B66D254A8B5E5951F589E5EDFD2454D5579157FF2B
            E22E9EFCFD84F8E8914A8B5F5951B5891542863FAD6E35A1C92B0C7753724D22
            E41AAF74332A23AA2EB1E8EC4F7D7F0719FEDAD9510A21173F1FFAE2E1C4E6D2
            2ADDA4CA84AA49ACE0E046D0EAD790579D25298FE36690D9E2974A37AB32A1EA
            11CBDFBF3178D566A26B5E90B8E4056458FC58E9E65516542D620504FC0FF4DC
            5A42AAE7E4A9800F47BDDA9F60E1C2FB4A37D5D9517588E5E7E7055EBD9ABC6A
            2B6B3D2ACC4589F61B6273DD53BAC9CE8CAA41AC7E012D514DB5836894160EAA
            710DF2118894E87CA59BEEACA8FCC4F20E7A1A6A9ECCFEA0716CC5DC72E88B02
            5CB345CBA8DCC4F20E78192A551CD154ADCC3FE4E56F1EC7AD82AE681021D72D
            A5BBC2D9507989E51BD899706705694133B6022423DE3EA8F4BD101B7B43E92E
            7126544E62F904D2E59914227D1DA5453180E7B6A330BF1756ADBAABB428CE82
            CA472C9FE05E803E8E485E539A0225D35C4750CCF7C38A98730AF68ED3A07211
            CB3FC8073CBF9070A19ED2A25804C7A59389C47B888EBEA0B4284AA352102B2C
            2C4CD5D7D7FB8BDBF979DF655EBEE27EFECE5D9CBF790B176FDF46CE8D9BB8F1
            A010B7EEDF2723925A6951698FE6802F7903F1F17F2A2D8AB2DDE0E4E81A16E6
            B6283474B857B366D3D46AB599BC3436EFE2D5CBC8BE7E1D8474389E938BDD99
            6771FADA0DE411C2F19C224DCC225D3B00F1518794EE3FA5E0F4C4CABD706162
            D3264DC65A2255452878F000A7CEE762FB8913D8F767360EE79E47D6B5EB28E1
            7947897E9E746F2F42AE238EEF35E5E1D4C4BA7AFDEAAF9E0D3C877212699D2B
            B76E62D5C1746C3D7602291919B843349ACC2800EFD61309113B64EF2C278373
            122B34B44697665ED302BABC36AC59830668DEE04934AA5B174FD6AE856A6E6E
            925451A8D562D7A9D388DFBB1F1B8F1E35D86CBC3CDA8C8CC77A1F24C4AE7668
            1F2A0C67241607DFC079E4FF21C6173D09B15A1082B56AE489364D9BA26DF3E6
            68F394067FD368E05EBDBA5D15E613C37FDB8993483E701029473270F9769EB4
            2DE2718DFC3B0A09D14B51EADFA8F2702E6291D91F4E654690AE0F12F27577A2
            BD28D93AB66C8E773B7644D717DAA0996723D833745ECFBF8BB587D2F1F3FA8D
            38989D2D5DDB78BE086E08454C4C9CDCDDE80C701E6205047840A75A4C9E409F
            8ABF589143934727A2C506FCE3657469FB02FEDEFA69B8BBBB338BB4E7742666
            A5ACC7FAC34770B750127B4C4F08361209557F4BBF7310CBDFBF2174EA487086
            2DEF9240C5EBD0B94573BCFDDC33F8A0470F346FCAB8A44870E85C1616FCB105
            BF6FDB0E9DDEEE5DF8B480EFAAFA260DE589E53DC8132A6D0279D555AE2A9EE0
            4BD0BFDDF318FAEEBB78A55D47E6A1F2F4A5CB1815156B30F60B8B8BED138AE7
            C6A1A6DB748487CB3E355502CA128B6ECF2AD2D14D0FFF744475AAA207E8D6EA
            29FC9710ECED6E6F31118CCE1C37661CC584652BB1373313E2D71A4DBE3F8B68
            AE118E68BBA3A11CB1FCFC9A83576F21AF9E7678A3B50FF06AC33A983D6C383A
            BDD881A98C7B8545F88D0C8FDF27AFC28DBBE5831AC4908D5B88364F0FAD6A99
            6E942196EFC0D6404912E48E4FB781271EE421A4E38B98F8E908346AD888A98C
            8C9CF3F8647138769D3ECD2A868E3C86705CBDF07155DAD2EF7862F906B705AF
            5F496A76B8A6B2085D319ADCBF85994386C0EFBD014C45DC2F2AC2E495AB3063
            CD5A684B98B9110FADFA13AC5C7A53E92E91028E2556406807E84A884DC53FA5
            74C30DA09EF6323BEBF6550C6CFB34E64F9E891A356A3015B7F6D06104FF3A1F
            B7EF316EE0E1B10AF56B0DC0C28576CE0C9487E388E51FF20AF4BA8DE4556DFB
            0B93299EBDB0007FD3DE46C2B4D968DFB63D5311477373D1FFA739C8BC72854D
            068EDB856A5C7F44465E93BE818E836388E513DC1D9C3E96BCF250BAC136A12B
            81C7A53388183711BDBABFCB54C4F5FC7CF498321D07B3B2D864E0B8ED70833F
            A2A22E2BDD1DAC909F583E417DA0C27C32EC3456BAB18241864875E601AC983C
            1DEFF5788FA988DCEB37D063EA349CB878114CDDCC61278A5403B0B2726A2E79
            89E51B487FF22BC85F35A51BCA82DA174E614A68283EFDF053A6FB6F115BEBAD
            C95371282B9B5102EE28E9B9EE955173C9472CDF80DEA4F818F2AAA643F6F8C9
            81622DEA9C3F8EC4A93FA2FBEB6CAB4DB9376EA0F337E3702D9F71D334C76740
            E7D613894B2F2ADD1DA2C496A554BF8060F0DC42F28A6D7AE54C20E4AA7E7407
            B646AEC0ABFF7895A98883E7B2D06DE264F6856C0EC789D27F1771E1D94A7787
            7091A54640703FE8F4D1A80AA42AC3837B689A9D8E933B8FA26EDDBA4C45446C
            DF8141F37F630F26E471016E7C3BC4C4DC56BA3B84405A62950E7FCBC82B69C2
            3C4543C621F7D239BCD7A21192225732AD3196E874E83E651AB61C3B6E8F1447
            A157F7A80CC3A2744F81CEFE38104DC54BB491D4C940354DC64E2C1A331E1F04
            7DC054C4B5BC3B6837FA1B5CBD73C71E498E83D3F5405CDC79A5BBA42248432C
            BFA07748CF2F260A836DC1ADB2E0DE6D34CA3A82839BF6A119637CD70FABD7E0
            AB683B834879A4A286BA27963AEFF28FFDC40A0A7A0DC53CF5A8571D9BAA229C
            4C45D0ABFF40E4BC48A6DBF544F375FA6A2C0EE7E4D82BC93EE8B56F396B0238
            FB881518F83C74D8447E414D956E88C3F0A000D5D237E340CA2EB47B812D21F3
            9A43E9E835ED4729A4D94CC8D5D3197374B1132B20E019E85429442FB756BA11
            0EC7F1BD08FAD7ABCC5AEB81B6182FFC7734B2AE4BE154E7179159EB17CE96E9
            868D58830679E27EF11FA451F6E4507722889C4D1616C0E3E8761CDB731C4D1B
            B325129C4E6CAD51F6DA5A65E0300771D19FCBDF4F6244120B6FEFDA50B9C793
            87D15369E115C5814D9832EC0B7CF5F968A6DB2FDCBA85BF7F35C6B0DD4C228C
            477CF444A5BBA50CE288D5B5AB1B1A379B4748F5A1D2820B874CBEADF367F0A2
            AA10697FA4316F31EB31651AD61FC990AA7D0FC071DE888B5A2B7D63C5435C8F
            FB061142F10B4093523FEEB87B0B6AA2B58EEF3A86679F7996A9885F366CC2A7
            4B22A4942A177AD56B488CCC55BA7B8413CBD7F7EFE0DCD6911F8872E12FC611
            9F4A43574C26FCEBF0C3A86F316AD828A622AEE4E541F3315BE48475F007A055
            BFA374B88DB0A744ED2A75F534F94E7CA8A438BA1BEF756C87E4A864E6225A7E
            3ADC10012131A6137B8B8DED124118B17C037E255F1D6AF13367D2228E46D631
            7869EFE0D0D643F0A8CF161CEB3B6B0E12F6A54A2B178762A8DDBA213A62B752
            5D639B11FEFEAF90717B8F52023A35AE5F802A6327CEA49E41EB566CEEBC71F1
            CB30696592F4B271FC19325C774062E20325BAA66262797BABC1B9AF9132A742
            9542413EB06735B6246F41B77F75632A62FE1F9B3174D11279E4E3F96F9110F3
            9D125D5331B17CFCFB8053AD94A89536ABAB742822CA605732621744C1AF9F1F
            5311897BF7C167F6CF72497815C55C47AC707C68B3F5274D73559DCCA4290EC5
            9CA5FC78A1B888102B09BF4E9983A1EF0F652A2225FD307AFE304362C18C7FC4
            DC47888F5AE4E8AEB14E2CBFA057892AA5C4B290E35A41EDF367063C543C468C
            9A8843E7CEE170CE795C22D3763B76205B80C0F695680D1A6BFA98C918398CED
            5CF2CDC78EE3CDEFA6C8D75F343D786C542B32C172682641EBBDE71B348B74B0
            53AD3F199079089AFBB771E964A976A7DBDB8FE4E41AE2CAB71D3F815D9999B8
            9A6757209D7018889584A95F4FC268C6A59D4D1947F17FDFFF60E113097FBC9C
            EE9F888BDBEF984E7958A5D54F7C03690CEDF38E1446104E1F80A6F0CE236295
            4701215AE6E5CB64883982DD6732919E9D834BB7650A13A743E1CE244C1FF73D
            467ECA7664F4EA0307F1DE0C9913FC71FC38C4C54C92B79272555ABC3A6C983B
            AEDEBC43D4277B9E45B9702A0D9AA27CABC42A0FBA2B3935F34F4C5FBD163B4E
            9F96363372D1FD521B6BEACF18FAC17F988A88DAB51BC13FCF93B9D35489888F
            F491B91213582696DFA0E6E0B58AAF3759C4C95468B4770513AB0C945011DB77
            62F0A2C52896CA1EBB4734E1DE7588F92D06FEFDFC998AF869CD3AFC372A46EE
            5E3B82F868B644608CB04C2CEFA067A1D29F724AF7C089FDD014DF134DAC320C
            9AB700E1846092E06A0E90B10B9B566CC29B5DDE642AE2CBC818CC58BB4EAEDE
            7A082E97CC0C5BCA5C89698D16AFD2D3E0759C731E32747C1F342505CCC45A99
            9A867E3FCD9646963F8F80CB3A8E937B4F324738BCF5DD54FC71EC985CBDF510
            E459C64739341F996562BDFF7E1D62053BE741DAC7F640A37BC04CAC5DA7CFE0
            B5F112C5C31DD981E6D580F4EDE968E0D140F4ED3403B3C7FB83A54AF55D01F8
            AD888F795DE64A4C50811F2BF00699F18AEF2DB971743734FA426662EDCF3C8B
            7F7E1B66BF1C3A62A7ED5F87373A75C61F2B37331571ECFC05BCF8E5573276D6
            43F0988304C7862E5B27964F6032F9942D878F9C38BA93104BAB3CB1A8E1BE2F
            055F0C1D811F27B1EDB899B36E3D3E5F4A3764C86CCBEAE18DC4E865F256628A
            8A34962F61BAF31DCF91B11D1ABE8499587BCF64E2D5711344DE65C15979E94F
            83BDB73E713DBABFDE9D491687D8573CEEA3F06E1347EFE2B14EACE0E046D0EA
            E9597B4D1C29904D1C21C4023BB124B3B10E6F474362EBE564E4A2E613E2B30A
            D0C3083A7D3DD6E0D09519E7111FDD42EE4ACAA3621DEC1B4817B11C60048840
            FA5668547A66626D3F751A5DC3EC74426B89B1BD630506FA8620FC9770A622E6
            AEDF88CFC297CADC590FA1D7764462E261C754568A8A891512F2148A4A88405C
            C38A8B71E0A2F421422C353BB1B611627533211683EC17338113A9589F4086C1
            37C40F83749BFDF32347E3F4C54B767545D7E7DB60FC807E66D7B3AFDF30F8EB
            FE6A223F0109316176552612B67BD42F6824116CBA2385AA10073743E3067662
            9D3C856E13EC887DA38734A5A6A075C30664343C8CDAB5C42781DE4B2610FF4B
            EC3C7B9797960C1D8CD02EFF36BB9E57701FAD3E1B41FE2F78D46C321CB24522
            32C236B1BCBD9F80AA3ADDFCC6E86093589B1DF8039A6A9C1DC43A49883599BD
            FE5BA4DE835BF0CD17DF60F218B672FACD988995070E8ABCCBBC1FB3E6CE8297
            A7E5C1A42FA923C9B88EA26A1E480AAFF884CF017E5DC1A9BCC0EBB3B12C6E1B
            7B2709DE4C11D899FCBC763AC5A2F4818D84586A76621D3F816E93BEB7A3FE4D
            A859780FA7D3CEA09946FC3908E959D97879EC784322367B4087C1ADE3C658FD
            3C9C66109CB7D0E88A7E04E2636759FC3225945A4D8FB9EB6A74D5AE03A444EC
            2B0CA4AD50247EDA04A91BA07177632616CDA8F7066B605DDE3583C61C14108A
            C573163315F13A21F556426E7B312B24089FF7B4BE15810E871E1F0C36BE944D
            8CBB09488C097F742520A003741C8DD9E96AA5987042AE412CF20927D6BB836B
            A276C112A291E50FBFA8684B59EA7A42AC6ACCC4B21E5867268469F7509908A9
            9AD670C3DE0D7BD1A299F8197C72DA41F4F9519AD8ABF41F26A343CB8AD79569
            425D7AD6753964933FBA584A8FDE0815501513B9C4193F86709AA21472DB0B92
            F40E0BF6AF83A6863B33B1361EC930E40235870D5BF0FA0583EF6AC2D713306E
            E438D1F53ED06A0D49404E5D3295DBCBD3930C6BCF898AB8A0F764CDB54DD009
            CB56206CD90AC1E5D2E1B53D21EBEC94F5E53F124D2E866C33012F136DB28EDC
            A9CC3AE2BEB5D03C51839958F47CE71E53454E728BB5867A5B356E8C8C9D194C
            33C17109CB316985E986274A106A2751039CBA08262C5B5E21C1EAD7AA85D07F
            FF0BBD3BBF6420812DD0E190DA5AC9C488B7A0B94CE4A033CCB2322919279813
            5214B9D8A66B3E413EE0781A9DA666BADF1EEC5D034DCD279889C5B42BE6E47E
            E0C25943C6E4DE3DFB88BB9760C5FE34F49F691AAA634C2A6394F9A08C8950E6
            AF1242266BB0445C4AD4992181165D1616C9C5F361488811B41EC6462CC3D6B0
            B3C3494D3398CB60C5EED5D0D4AEC94CACB587D2F1AE98348D372E1283661B02
            0604207A41B4E8FAE889141D468FC165A3B87B6A1B6D1D3F06F56B5A5F0A3268
            1A62935103DD1E42954719C15A12620F2765572483457209715BC05E52F8047D
            4B4A20B345DE716E885DC9D0D4A9CD4CAC35070EA1D78C9F2AF88691AD753FDF
            E0907DE6A96638B0390D75EB883B3C80DA55037E9A8D75878F985CAFC8FFE46C
            309B0070BA6E88B3EDE3B25FDBF806CD270F6388C35ABA33099ABA759889B58A
            D81BBD85EC8AA1B3C0B48DE0EEDE24DC3A888EED3A8AAE6B4C5C02BE4F5A6576
            3D8C0C6B9696629C0D54BBB51A36DCE412D1581DE5D7581474583C91F91B29E9
            7D87B4D64E6225A71D20537E633FA185D9A0BE0438771CD52E9CC6DC1FE662C8
            40F1BF9B29845063E3130DEB82E541879FAC9F6755380C3903CCF60770FC04C4
            095B7394C63EEA135A1FEE5A629D7221C26F2A7BA022967CE843DA458955973D
            E69D18D2FD66DA8879CF3A0A9CCDC0C8615F62DAF8A964122C2E8161FCEEBD08
            FA75FE43EFBAE5F639BBD6B2ACAD0A88B64AB2A9AD00290D6F6FEFEA505523F3
            694EBEA4B712106BC5FE5432439B63FD0BE7CF18F62EF67DA72F6217C5C2BDBA
            38F3317CEB0E7CFCFB6214D9D862E6EC5ACB4C5BE9F941265E7B1B9076466748
            7EDB348E14DB5FF84D623496BED478B78358CBF6A5C27BD66CCB75D2A8D013FB
            0DA7AA46CF8F12E5AFA2910A3FAE4DC137B1F128365907B4DEBED02EAF61C950
            76F3946A956D274E2087FC4F5FD30901256A7BAF9676BB26CCB4557C742B3165
            48EF2A080DAD81C2127A54EF40B6022A201A0D59A11AAB5E3D6662594C1B4435
            2125D549A2CD7AF547C2EFF150A9840F7F85C5C5189FB01C33D6ACB568535584
            DB8B178AD25A79F7EF63F6BAF5067704258035D4AF55137D5EEA4486DBFEA267
            A066911122B515853C3EA8909006D0EA08B9D05FD23AF4BA87C4AACF4CACF83D
            FBE037A71CB1B28E19B2D884F806E39769BF88D254D44FF5F992A5882384150B
            6B4E526BA00F9B0E51D4A32E06C37B74C778EFFE8209CCEA6230867CCECD1EC3
            DC51372F82B0C157B23229B1E8ACB03E3BB1E2F6EC85FF9C5F4ADF50ED72723F
            54577330F23F5F60E2571345E56CA721301F2DFC9DF9B47A6B817A963022220A
            B3CCD7F004839277EBB8B182484C4945C9657C496CA0A0BC5E7343AAC9EAE1A4
            962049CAA37BF9A8C6AAEFC14CAC1832630B9C4B88F5E02EB1A7F6A1493515C6
            8F0AC3908183051F70493798CE59B701D356AF41FE03B6149F545BD10805215A
            C432A9B83C621A4480536D83AAE430D128D9E8D3A73E6AD4EE407E30344F03DD
            47E8655AA7707299692D811EF747D231F58A18505744F5E269A4A68FEC2E4B02
            6245EFDA8DA0B0B14453A5A1759326581EB11CEDDBB6177C7F466E2E46C7C41B
            16B3ED8150C3DD7284029784A27B836C4EFD7D03A9054E03F8EA975D12B29C44
            4187DDBEA68E64BA1923027AED36211B331CB3CE479DA8A732E7109BEB13BBCA
            A1C4A243A1073BB1229312113238003EBDFA61C18F0B50BF7E7D41F7DD2B2CC2
            D4A464C3CC8F1AEBF682DA56B6666E166667A29C9406F8F97981576F8591F612
            E243B310376F221AE8F0A8D345580B6176E4023207FF8099D073EC5BBD4B8A4B
            DD0D76106BE3B64DB87DFB16BC7B0F20333FDBC1193405E5C2CD5B3063F53AE4
            4894E85F683C953D9E6F1394468A5272197E45427D685602058D916DF8E37483
            0C43B1111C9FA7C89E106703B1A8C67A9299584271F3EE3DAC484DC3772B9325
            39398286A8746DF31C7A77EE843E9D5FB2F950A5F02599C027288C10737CD95B
            215AABCC4F46A32CE8EE262BDA8BC2CCB8773CB168B6C06BB7461003732CB196
            6B8972903ECCF9A9F168201BB1F69D3D6B70A22E277FD97612CA3830AF83574B
            51FE2AEAAB1ABE34EAAF0B0CBE24131896DD8AE9F4D5A0B5A8014FA32CC4806A
            AF88ED3BC8FFA708E9AE9B7E58CC7B6145CCA3F38895CBACE61B487758D339AD
            704F64F143623D292DB1AEDDC9C7F2FDA988DDB30F87B2B35120415A215BBB68
            6CA1DC3094473402DB992AC6F00D204CFACB14B1277C6744442499A96EF8EB82
            D3108BC22FE47DF0BADF20945C0FF3AA6B9E6C6817B1E8F24B464E2E99D96518
            92726C276ABED8CEED58E5612FB13C3E1822FD8653BF8050F0DCA36330568E1C
            8E3E2FBDC45494D96CD5A98845E11BE04746C370417B161F6629D6346027163D
            783268EE3CDCBC276FF2157B89C5F919BBFEF870C4C7306DC332C180A0AE50F3
            5BCBDE860F1D8C81021DB4E5E1FCC4A20808EE8712FD3C224DA30ABFA77DA8B1
            EC2056F8CE5D18F4CB7CD99BE42296B3C027A83F99B5D02C644F58FD0ECDF242
            DD0D8F01B14C87423E99104BFC2E8EF2F009EA43FAF8D156A1AA3D141A2320E0
            65E854C9A4232DE7E4A2C4A2436143CF2A4FAC8E5F8DC1E1EC47CF4916E35DC8
            A6576BA85CC4A2F00E7C914845F72D3633FBECE1695B95815814F4A1D1CDA842
            F7011AC36C7D9021C2C00CBE81D4DDE0455F0A75D21A8386EC50B2D3F0EEF01D
            3B4DA32C9C9E58860E08F91BA05B435E3D6372DD402CAAB11A550A6219834EEB
            29B9CA4866CBA72545848109CACD0885AE5552272925125D3B3C9C93632D64C7
            CC79EB9CC4A2F00E790A6AFD76F0FC5F47973E3C6244D3B071A523963128A968
            809F2D982DA9F0084542B4F863EF2DAC170AF1619905FC5903AFEF8B84589363
            629D975814945C2A5D0A79F5A2E13D2516B5B13CA524969CD908B93C52BEC555
            6E218BD016B4561EF47C3724C6084FFB484369AAD7DA4A9AF8E8C81321DACAE2
            0278B9AF105992A15625212E6A9B59CB65EA51E94093EC16F3CB88E67A0D0FC8
            2C6977B2C4C4920BAAF1888F9C083F32C5D7E9C96C8CEB62FC706954E7CC81C1
            364B099DB7C0700690292AC875650C0B9A4A68D4AA797E2D03B691BF6462EF25
            955F742E0FE72716C5E0C13571A7201985056F1A8642CF26CEABB1A85B5F85C9
            B873FB3BA4A498A644F60DA4FBEC454518509BA6DBA4C9C633C43294E6BB2ABE
            9F641697559A488DEE39082D7F53FAD4EFD1C1CB760AA672B3523A7968658B4C
            C6A81CC4A2E8DBB7018A0AE7605F4A80A69194C462815532E6938F26133B689A
            C5DB18220C28E8B0448744B385DFBFC4394CC4C923FFD7279AD1CBD2F05B9A00
            24C8300CDA828521D801698C94448B7A1E28BCB758F3A4671FFB8965891C7669
            AF62A2AD462221C6FAA6C572110662F61652CD457D472C71EFD4ED416D2A219A
            8A82DA56263B809C6A33855CE8D4A95A6B2E3FE96CDA19A68DB132D95825E054
            1F2376E9629B672F1BF99228C44618584A73640D544B8DEFDFD7905546282C44
            8EE611627514330C52543E62518485A9AE7DF69F259E1E9E22B6F49742066291
            27C07F88F818DBC7C330FA922CC138088F3A2EE9304989E4D5B0A181A82C4ED9
            325888B3AFE243A111366CD850EBC50EED676A1A3516B549839D581687C93CC3
            269138810720D9A9AD1C058BF1EE55D678B7828B572ECD26C6FC6742B76E49A8
            B16E40A5EA8BD8C85D82BE2DA1B6720466AD5B8F11C611AC223DFF959E5814D7
            AE5D9BD3B061C36142C82509B178FE1E50ED6D2444EC16F47D46CFB7D268356C
            84E94C5484115F25884571F1F2C5098D1A361AE7E6E656E1F7EC2616871CA8D4
            3E88599A2AF81E9FA0F1E0F8B0B2B7CEAEADCA60CF7A65952156585898DBFB1F
            7E385AD3A4F12437B59BD576D949AC1C32FB1B80B8C803A2EEF2094C37F6BA57
            066D55063347A94372903A21B22FE44E6CD6A4E958B55A6DB16DCCC4E2710D3A
            7D172C8F3D25FA5EDF403A0C762D7B2B68C32899E9456CDB6198DD49494231E5
            D2A5A450E353C4281E5762519C3C7366D833AD5BCF525BC845C448AC5350F36F
            23262647EC8D06946E7537097EB246AEB23445D4115A16A242874E967444F694
            6B915422DC0E559258C4B8E64E9F3DF381570BAF5FAA1398F48C78629D2646EB
            5BC4683D6F974C7E416144AEF1C697CA938B2EFCD29998B53445D42F45735E09
            D56265DA29C9C60102540E1AFB5E56A64552D165236D4137C7A78A743E7097AE
            5CF9A88187C76CC2AD1A65174512EB08547A3FC4320C7F9660855C5D0861A837
            BDA2446AC6101AF62C26F5112555A8815C9E76938AA22A13CB80B4C307877468
            DBFE6737B5DA305D1441AC73D0ABFF8DC4A5172515C802B92CE3619A2215D71B
            E5D2115108C9046866780B28D70C0CA432D42269A73929F6A4EDF7EFD8AEFDA2
            1AD5DD6B0A2216C791595F496F32FCD977B6AE35D8265738197E273CF2741B9C
            ABAA81E429777DF4051B5BB7CC02F54A232022505410FE8824A572D0F01A2F8B
            853092CAD085B2749C13E26C6EAE5F8BA64D1746EFD95BA742627148854EDD4F
            724D551E96C9B58D4C12469049827984686964C4A37353A8ADB572A4F5732ACD
            02F52C840F97CAE1E74534731869B769CE583B4855DA8D8F11CEDFBCD97FD5C1
            F4DF3FF97D493D2B5F3905BDB61B1213AF3844A0D2659E2E86D71C176129C4D7
            04466E0B5B71F3A233F25182E954C3C91049FBE60899FD89CB18520E8F15B128
            BA4D98FCCED69327E2C92FB256B9AED80395AE1F31D4AF2A2DA355940B14AC28
            6EDE7427B5331E365E15E1EDDF052A158D48289BB3EF811B7A203A3A5F69D12A
            048D9FE7FFDA226F2D6E9E9E4FD8C724CDA3C0187909F178128BC227B87BE996
            7EFE0CAAAB02101999ABB448826014372F1822435EA4C0E34B2C0AFFE02E28C4
            49AC8CBCA6B42882516E9BBC00D8970990118F37B12A232C84E054087B330132
            C245ACCA08D3199C75089969CA0417B15C90052E62B9200B5CC4724116B888E5
            822C7011CB0559E022960BB2C0452C1764818B582EC882FF07DD2E04692E5EAE
            D40000000049454E44AE426082}
        end
        object DataImpressao: TRLLabel
          Left = 517
          Top = 3
          Width = 96
          Height = 14
          Caption = 'Data da Impress'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblData: TRLLabel
          Left = 616
          Top = 3
          Width = 97
          Height = 14
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 172
          Top = 75
          Width = 107
          Height = 16
          Caption = 'Vers'#227'o Sistema:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblVersaoSelecionada: TRLLabel
          Left = 321
          Top = 75
          Width = 55
          Height = 16
          Caption = 'Sistema'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand2: TRLBand
        Left = 38
        Top = 205
        Width = 718
        Height = 19
        AutoSize = True
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object rldbtxtSISTEMA: TRLDBText
          Left = 3
          Top = 2
          Width = 61
          Height = 16
          DataField = 'SISTEMA'
          DataSource = dmConsultaDependencias.dsConsulta
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 307
          Top = 2
          Width = 50
          Height = 16
          DataField = 'MINIMA'
          DataSource = dmConsultaDependencias.dsConsulta
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 459
          Top = 2
          Width = 54
          Height = 16
          DataField = 'MAXIMA'
          DataSource = dmConsultaDependencias.dsConsulta
          Text = ''
        end
        object RLDBText1: TRLDBText
          Left = 603
          Top = 2
          Width = 51
          Height = 16
          DataField = 'GRUPO'
          DataSource = dmConsultaDependencias.dsConsulta
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 188
        Width = 718
        Height = 17
        AutoSize = True
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel1: TRLLabel
          Left = 3
          Top = 0
          Width = 190
          Height = 16
          Caption = 'Sistema'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 307
          Top = 0
          Width = 98
          Height = 16
          Caption = 'Vers'#227'o Minima'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 459
          Top = 0
          Width = 100
          Height = 16
          Caption = 'Vers'#227'o M'#225'xima'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object rlGrupoSistema: TRLLabel
          Left = 603
          Top = 0
          Width = 98
          Height = 16
          Caption = 'Grupo Sistema'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0.0.1 \251 Copyright '#169' 1999-20' +
      '21 Fortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 528
    Top = 344
  end
end
