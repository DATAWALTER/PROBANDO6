package misrc;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

public class MiObjectOutputStream extends ObjectOutputStream { //(1)

    public MiObjectOutputStream(OutputStream out) throws IOException { //(2)
        super(out);
    }

    protected MiObjectOutputStream() throws IOException, SecurityException { //(3)
        super();
    }

    protected void writeStreamHeader() throws IOException { //(4)
    }
}

/*
LEYENDA

(1) RedefiniciÓn de la clase ObjectOuputStream para que no escriba una cabecera al inicio del Stream.
(2) Constructor que recibe OutputStream
(3) Constructor sin parámetros.
(4) Redefinición del método de escribir la cabecera para que no haga nada.
*/
