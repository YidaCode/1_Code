from PIL import Image, ImageDraw, ImageFont
import cv2
import imageio
import numpy as np

def read_video(video_path):
    video_cap = cv2.VideoCapture(video_path)
    frame_count = 0
    all_frames = []
    while True:
        ret, frame = video_cap.read()
        # frame = cv2.cvtColor(frame,cv2.COLOR_BGR2RGB)
        if ret is False:
            break
        img_PIL = Image.fromarray(cv2.cvtColor(frame,cv2.COLOR_BGR2RGB))
        font = ImageFont.truetype("1.TTF",100)
        str_word = "宝，我给你抓拖孩了！"
        draw = ImageDraw.Draw(img_PIL)
        draw.text((100,400), str_word,font=font)
        frame = np.asarray(img_PIL)
        if frame_count % 2 == 0:
            all_frames.append(frame)
            cv2.imshow('frame', frame)
            cv2.waitKey(1)
        frame_count += 1
        print(frame_count)
    video_cap.release()
    cv2.destroyAllWindows()
    print('===>', len(all_frames))
    return all_frames


def frame_to_gif(frame_list):
    gif = imageio.mimsave('./result.gif', frame_list, 'GIF')

if __name__ == "__main__":
    frame_list = read_video('fish.mp4')
    frame_to_gif(frame_list)