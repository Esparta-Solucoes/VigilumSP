-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-09-21 14:43:13 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE tb_clima_chuva (
    cd_clima_chuva          VARCHAR2(100) NOT NULL,
    tb_distrito_cd_distrito VARCHAR2(100) NOT NULL,
    media_chuva             NUMBER NOT NULL
);

COMMENT ON COLUMN tb_clima_chuva.media_chuva IS
    'media_mensal_chuva';

CREATE UNIQUE INDEX tb_clima_chuva__idx ON
    tb_clima_chuva (
        tb_distrito_cd_distrito
    ASC );

ALTER TABLE tb_clima_chuva ADD CONSTRAINT tb_clima_chuva_pk PRIMARY KEY ( cd_clima_chuva );

CREATE TABLE tb_clima_hist (
    cd_previsao      VARCHAR2(100) NOT NULL,
    tb_zona_cd_zona  VARCHAR2(100) NOT NULL,
    dt_previsao      DATE NOT NULL,
    hora_previsao    DATE NOT NULL,
    temp_max         NUMBER NOT NULL,
    temp_min         NUMBER NOT NULL,
    umid_max         NUMBER,
    umid_min         NUMBER,
    vel_vento        NUMBER,
    vol_precipitacao NUMBER,
    tp_nuvem         VARCHAR2(100),
    pressao_atm      NUMBER
);

ALTER TABLE tb_clima_hist ADD CONSTRAINT tb_clima_hist_pk PRIMARY KEY ( cd_previsao );

CREATE TABLE tb_clima_prev (
    cd_previsao      VARCHAR2(100) NOT NULL,
    tb_zona_cd_zona  VARCHAR2(100) NOT NULL,
    dt_referencia    TIMESTAMP NOT NULL,
    dt_futura        TIMESTAMP NOT NULL,
    temp_max         NUMBER NOT NULL,
    temp_min         NUMBER NOT NULL,
    umid_max         NUMBER,
    umid_min         NUMBER,
    vel_vento        NUMBER,
    vol_precipitacao NUMBER,
    tp_nuvem         VARCHAR2(100),
    pressao_atm      NUMBER
);

ALTER TABLE tb_clima_prev ADD CONSTRAINT tb_clima_prev_pk PRIMARY KEY ( cd_previsao );

CREATE TABLE tb_clima_risc (
    cd_clima_risco            VARCHAR2(100) NOT NULL,
    tb_clima_hist_cd_previsao VARCHAR2(100) NOT NULL,
    ds_risco                  VARCHAR2(100) NOT NULL
);

CREATE UNIQUE INDEX tb_clima_risc__idx ON
    tb_clima_risc (
        tb_clima_hist_cd_previsao
    ASC );

ALTER TABLE tb_clima_risc ADD CONSTRAINT tb_clima_risc_pk PRIMARY KEY ( cd_clima_risco );

CREATE TABLE tb_distrito (
    cd_distrito   VARCHAR2(100) NOT NULL,
    nm_distrito   VARCHAR2(100),
    coord_central VARCHAR2(100)
);

ALTER TABLE tb_distrito ADD CONSTRAINT tb_distrito_pk PRIMARY KEY ( cd_distrito );

CREATE TABLE tb_enderecos (
    cd_end                  VARCHAR2(100) NOT NULL,
    tb_zona_cd_zona         VARCHAR2(100) NOT NULL,
    tb_distrito_cd_distrito VARCHAR2(100),
    tb_solo_cd_solo         VARCHAR2(100),
    tb_infra_cd_infra       VARCHAR2(100),
    nr_cep                  VARCHAR2(100) NOT NULL,
    "long"                  VARCHAR2(100),
    lat                     VARCHAR2(100),
    cd_setor                VARCHAR2(100),
    st_setor                VARCHAR2(100),
    tp_logra                VARCHAR2(100),
    titulo_logra            VARCHAR2(100),
    nm_logra                VARCHAR2(100),
    nr_edif                 NUMBER,
    mod_num_logra           VARCHAR2(100),
    elem1                   VARCHAR2(100),
    vl1                     VARCHAR2(100),
    elem2                   VARCHAR2(100),
    vl2                     VARCHAR2(100),
    localidade              VARCHAR2(100),
    indica_end              VARCHAR2(100),
    nr_quadra               NUMBER,
    nr_face                 NUMBER,
    setcens                 VARCHAR2(100),
    areap                   VARCHAR2(100),
    setcens2                VARCHAR2(100),
    areap2                  VARCHAR2(100)
);

COMMENT ON COLUMN tb_enderecos.mod_num_logra IS
    'Modifica numero logradouro';

COMMENT ON COLUMN tb_enderecos.indica_end IS
    'Indica endereco';

CREATE UNIQUE INDEX tb_enderecos__idx ON
    tb_enderecos (
        tb_solo_cd_solo
    ASC );

CREATE UNIQUE INDEX tb_enderecos__idxv1 ON
    tb_enderecos (
        tb_infra_cd_infra
    ASC );

ALTER TABLE tb_enderecos ADD CONSTRAINT tb_enderecos_pk PRIMARY KEY ( cd_end );

CREATE TABLE tb_energia_hist (
    cd_queda_ener    VARCHAR2(100) NOT NULL,
    tb_zona_cd_zona  VARCHAR2(100) NOT NULL,
    dt_hr_inicio     TIMESTAMP NOT NULL,
    dt_hr_fim        TIMESTAMP,
    ds_causa_queda   VARCHAR2(100),
    ind_hist_energia VARCHAR2(100),
    st_queda_energia VARCHAR2(100)
);

COMMENT ON COLUMN tb_energia_hist.ind_hist_energia IS
    'Indice hist energia';

ALTER TABLE tb_energia_hist ADD CONSTRAINT tb_energia_hist_pk PRIMARY KEY ( cd_queda_ener );

CREATE TABLE tb_infra (
    cd_infra            VARCHAR2(100) NOT NULL,
    tb_enderecos_cd_end VARCHAR2(100),
    ds_assentamentos    VARCHAR2(100),
    ds_esgoto           VARCHAR2(100),
    idh_infra           NUMBER
);

CREATE UNIQUE INDEX tb_infra__idx ON
    tb_infra (
        tb_enderecos_cd_end
    ASC );

ALTER TABLE tb_infra ADD CONSTRAINT tb_infra_pk PRIMARY KEY ( cd_infra );

CREATE TABLE tb_infra_risco (
    cd_infra_risco    VARCHAR2(100) NOT NULL,
    tb_infra_cd_infra VARCHAR2(100) NOT NULL,
    ds_risco          VARCHAR2(100) NOT NULL
);

CREATE UNIQUE INDEX tb_infra_risco__idx ON
    tb_infra_risco (
        tb_infra_cd_infra
    ASC );

ALTER TABLE tb_infra_risco ADD CONSTRAINT tb_infra_risco_pk PRIMARY KEY ( cd_infra_risco );

CREATE TABLE tb_ocorrencia (
    cd_ocorrencia      VARCHAR2(100) NOT NULL,
    primeiro_nome      VARCHAR2(100) NOT NULL,
    sobrenome          VARCHAR2(100) NOT NULL,
    ds_email           VARCHAR2(100) NOT NULL,
    nr_telefone        VARCHAR2(100),
    ds_assunto         VARCHAR2(100) NOT NULL,
    ds_ocorrencia      VARCHAR2(500) NOT NULL,
    ds_mensagem        VARCHAR2(100),
    aceite_termos_cond VARCHAR2(1) NOT NULL
);

ALTER TABLE tb_ocorrencia ADD CONSTRAINT tb_ocorrencia_pk PRIMARY KEY ( cd_ocorrencia );

CREATE TABLE tb_prev_risco (
    cd_previsao_risco         VARCHAR2(100) NOT NULL,
    tb_clima_prev_cd_previsao VARCHAR2(100) NOT NULL,
    ds_risco                  VARCHAR2(100) NOT NULL
);

CREATE UNIQUE INDEX tb_prev_risco__idx ON
    tb_prev_risco (
        tb_clima_prev_cd_previsao
    ASC );

ALTER TABLE tb_prev_risco ADD CONSTRAINT tb_prev_risco_pk PRIMARY KEY ( cd_previsao_risco );

CREATE TABLE tb_solo (
    cd_solo             VARCHAR2(100) NOT NULL,
    tb_enderecos_cd_end VARCHAR2(100),
    coord_geotecnicas   VARCHAR2(100),
    ds_ocorr            VARCHAR2(100)
);

CREATE UNIQUE INDEX tb_solo__idx ON
    tb_solo (
        tb_enderecos_cd_end
    ASC );

ALTER TABLE tb_solo ADD CONSTRAINT tb_solo_pk PRIMARY KEY ( cd_solo );

CREATE TABLE tb_solo_risco (
    cd_solo_risco   VARCHAR2(100) NOT NULL,
    tb_solo_cd_solo VARCHAR2(100) NOT NULL,
    ds_risco        VARCHAR2(100) NOT NULL
);

CREATE UNIQUE INDEX tb_solo_risco__idx ON
    tb_solo_risco (
        tb_solo_cd_solo
    ASC );

ALTER TABLE tb_solo_risco ADD CONSTRAINT tb_solo_risco_pk PRIMARY KEY ( cd_solo_risco );

CREATE TABLE tb_zona (
    cd_zona       VARCHAR2(100) NOT NULL,
    nm_zona       VARCHAR2(100) NOT NULL,
    poligono      VARCHAR2(100) NOT NULL,
    coord_central VARCHAR2(100)
);

ALTER TABLE tb_zona ADD CONSTRAINT tb_zona_pk PRIMARY KEY ( cd_zona );

ALTER TABLE tb_clima_chuva
    ADD CONSTRAINT tb_clima_chuva_tb_distrito_fk FOREIGN KEY ( tb_distrito_cd_distrito )
        REFERENCES tb_distrito ( cd_distrito );

ALTER TABLE tb_clima_hist
    ADD CONSTRAINT tb_clima_hist_tb_zona_fk FOREIGN KEY ( tb_zona_cd_zona )
        REFERENCES tb_zona ( cd_zona );

ALTER TABLE tb_clima_prev
    ADD CONSTRAINT tb_clima_prev_tb_zona_fk FOREIGN KEY ( tb_zona_cd_zona )
        REFERENCES tb_zona ( cd_zona );

ALTER TABLE tb_clima_risc
    ADD CONSTRAINT tb_clima_risc_tb_clima_hist_fk FOREIGN KEY ( tb_clima_hist_cd_previsao )
        REFERENCES tb_clima_hist ( cd_previsao );

ALTER TABLE tb_enderecos
    ADD CONSTRAINT tb_enderecos_tb_distrito_fk FOREIGN KEY ( tb_distrito_cd_distrito )
        REFERENCES tb_distrito ( cd_distrito );

ALTER TABLE tb_enderecos
    ADD CONSTRAINT tb_enderecos_tb_infra_fk FOREIGN KEY ( tb_infra_cd_infra )
        REFERENCES tb_infra ( cd_infra );

ALTER TABLE tb_enderecos
    ADD CONSTRAINT tb_enderecos_tb_solo_fk FOREIGN KEY ( tb_solo_cd_solo )
        REFERENCES tb_solo ( cd_solo );

ALTER TABLE tb_enderecos
    ADD CONSTRAINT tb_enderecos_tb_zona_fk FOREIGN KEY ( tb_zona_cd_zona )
        REFERENCES tb_zona ( cd_zona );

ALTER TABLE tb_energia_hist
    ADD CONSTRAINT tb_energia_hist_tb_zona_fk FOREIGN KEY ( tb_zona_cd_zona )
        REFERENCES tb_zona ( cd_zona );

ALTER TABLE tb_infra_risco
    ADD CONSTRAINT tb_infra_risco_tb_infra_fk FOREIGN KEY ( tb_infra_cd_infra )
        REFERENCES tb_infra ( cd_infra );

ALTER TABLE tb_infra
    ADD CONSTRAINT tb_infra_tb_enderecos_fk FOREIGN KEY ( tb_enderecos_cd_end )
        REFERENCES tb_enderecos ( cd_end );

ALTER TABLE tb_prev_risco
    ADD CONSTRAINT tb_prev_risco_tb_clima_prev_fk FOREIGN KEY ( tb_clima_prev_cd_previsao )
        REFERENCES tb_clima_prev ( cd_previsao );

ALTER TABLE tb_solo_risco
    ADD CONSTRAINT tb_solo_risco_tb_solo_fk FOREIGN KEY ( tb_solo_cd_solo )
        REFERENCES tb_solo ( cd_solo );

ALTER TABLE tb_solo
    ADD CONSTRAINT tb_solo_tb_enderecos_fk FOREIGN KEY ( tb_enderecos_cd_end )
        REFERENCES tb_enderecos ( cd_end );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            14
-- CREATE INDEX                             9
-- ALTER TABLE                             28
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
