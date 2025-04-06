from ultralytics import YOLO
import torch

def get_rocm_device():
    # Check if PyTorch was compiled with ROCm (HIP backend)
    if hasattr(torch.version, 'hip') and torch.version.hip is not None:
        return 'cuda' if torch.cuda.is_available() else 'cpu'
    return 'cpu'

if __name__ == '__main__':
    device = get_rocm_device()
    
    print(f'Using device: {device}')
    
    model = YOLO('yolov11m-cls.pt')

    results = model.train(
        data='./YOLOModel.yaml',
        imgsz=1024,
        epochs=50,
        batch=16,
        name='yolov8m_rocm',
        project='./YOLO_Training',
        workers=10,
        optimizer='AdamW',
        lr0=0.001,
        patience=5,
        cache='ram',
        device=device
    )

    # Evaluate after training
    metrics = model.val()
