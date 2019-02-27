package Ejercicio
  package Connectors
    connector Pin
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;
      annotation(
        Icon(graphics = {Ellipse(origin = {1, -2}, fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-13, 12}, {13, -12}}, endAngle = 360)}));
    end Pin;

    connector PositivePin
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;
      annotation(
        Icon(graphics = {Ellipse(fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-12, 12}, {12, -12}}, endAngle = 360)}));
    end PositivePin;

    connector NegativePin
      Modelica.SIunits.Voltage v;
      flow Modelica.SIunits.Current i;
      annotation(
        Icon(graphics = {Ellipse(fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, extent = {{-12, 12}, {12, -12}}, endAngle = 360)}));
    end NegativePin;

    partial model TwoPin
      Modelica.SIunits.Voltage v;
      Modelica.SIunits.Current i;
  PositivePin p annotation(
        Placement(visible = true, transformation(origin = {-106, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-106, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  NegativePin n annotation(
        Placement(visible = true, transformation(origin = {98, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {98, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      v = p.v - n.v;
      0 = p.i + n.i;
      i = p.i;
    end TwoPin;

  end Connectors;

  package Modelos
    model FuenteI
      parameter Modelica.SIunits.Current I(start = 1) "Value of constant current";
      extends Ejercicio.Connectors.TwoPin;
    equation
      i = I;
      annotation(
        Icon(graphics = {Ellipse(origin = {-22, 5}, extent = {{58, -57}, {-58, 57}}, endAngle = 360), Line(origin = {-28, 6}, points = {{0, -38}, {0, 38}}), Line(origin = {-39, 30}, points = {{11, 14}, {-11, -14}}), Line(origin = {-17, 30}, points = {{-11, 14}, {11, -14}})}));
    end FuenteI;


    model FuenteV
    parameter Modelica.SIunits.Voltage V(start=1) "Value of constant voltage";
      extends Ejercicio.Connectors.TwoPin;
    equation
      v = V;
    annotation(
        Icon(graphics = {Line(origin = {-2, 20}, points = {{-50, 0}, {50, 0}}), Line(origin = {1, -20}, points = {{-23, 0}, {21, 0}})}));end FuenteV;







  end Modelos;
  annotation(
    uses(Modelica(version = "3.2.2")));
end Ejercicio;
