create or replace PACKAGE BODY PR_GL_PACKAGE AS

  FUNCTION FN_MERGE_JVE (q IN VE_ARRAY_T, w IN VE_ARRAY_T) RETURN VE_ARRAY_T AS
  tmp VE_ARRAY_T;
  BEGIN
  
    FOR idx in 1..q.COUNT LOOP
        tmp(idx) := q(idx);
    END LOOP;
    
    FOR jdx in 1..w.COUNT LOOP
        tmp(jdx + q.COUNT) := w(jdx);
    END LOOP;
  
    RETURN tmp;
  END FN_MERGE_JVE;

END PR_GL_PACKAGE;