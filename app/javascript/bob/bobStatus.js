const bobWorking = () => {
  const canva = document.getElementById('canvas')
  new Rive({
    src: canva.src,
    canvas: canva,
    autoplay: true
  });
}
export { bobWorking };
